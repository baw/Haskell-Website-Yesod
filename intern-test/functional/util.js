define([
    'intern/chai!assert'
], function (assert) {
    return {
        clickLink: function (name) {
            return function () {
                return this.parent
                    .findById(name + 'Link')
                        .click()
                        .end();
                };
        },

        checkPagesLowered: function (number, name) {
            return function () {
                return this.parent
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
            var self = this;
            return function () {
                return this.parent
                    .then(self.clickLink(name))
                    .then(self.checkPagesLowered(1, name))
                    .then(self.checkUrl(name));
            };
        },

        checkUrl: function (name) {
            return function () {
                return this.parent
                    .getCurrentUrl()
                    .then(function (url) {
                        name && assert.include(url, '/' + name);
                    });
            };
        }
    };
});
