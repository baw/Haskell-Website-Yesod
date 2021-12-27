const { assert } = intern.getPlugin('chai');

module.exports =  {
    clickLink: function (name) {
        return function ({ remote }) {
            return remote.parent
                .findById(name + 'Link')
                    .click()
                    .end();
            };
    },

    checkPagesLowered: function (number, name) {
        return function ({ remote }) {
            return remote.parent
                .findAllByClassName('lower')
                    .then(function (nodes) {
                        assert.equal(nodes.length, number);

                        if (name) {
                            return nodes[0].getComputedStyle('className')
                                .then(function (className) {
                                    assert.notInclude(className, name);
                                });
                        }
                    })
                    .end();
        };
    },

    checkLink: function (name) {
        return function ({ remote }) {
            return remote.parent
                .then(self.clickLink(name))
                .then(self.checkPagesLowered(1, name))
                .then(self.checkUrl(name));
        };
    },

    checkUrl: function (name) {
        return function ({ remote }) {
            return remote.parent
                .getCurrentUrl()
                .then(function (url) {
                    name && assert.include(url, '/' + name);
                });
        };
    }
};
