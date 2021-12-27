const { assert } = intern.getPlugin('chai');

module.exports =  {
    clickLink: function (remote, name) {
        return function () {
            return remote
                .findById(name + 'Link')
                    .click()
                    .end();
            };
    },

    checkPagesLowered: function (remote, number, name) {
        return function () {
            return remote
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

    checkLink: function (remote, name) {
        const that = this;
        return function () {
            return remote
                .then(that.clickLink(name))
                .then(that.checkPagesLowered(1, name))
                .then(that.checkUrl(name));
        };
    },

    checkUrl: function (remote, name) {
        return function () {
            return remote
                .getCurrentUrl()
                .then(function (url) {
                    name && assert.include(url, '/' + name);
                });
        };
    }
};
