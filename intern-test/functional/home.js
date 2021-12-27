const { describe, beforeEach, it, b } = intern.getInterface('bdd');
const { expect } = intern.getPlugin('chai');
const util = require('./util');

describe('homePage', function () {
    beforeEach(function () {
        return this.remote
            .get('http://localhost:3000/');
    });

    describe('has correct content', function () {
        it('name', function () {
            return this.remote
                .findByCssSelector('#main h1')
                    .getVisibleText()
                    .then(function (text) {
                        assert.equal(text, 'Brian Weiser');
                    });
        });

        it('role', function () {
            return this.remote
                .findByCssSelector('#main h2')
                    .getVisibleText()
                    .then(function (text) {
                        assert.equal(text, 'Software Engineer');
                    });
        });
    });

    describe('internal links work', function () {
        beforeEach(function () {
            return this.remote
                .then(util.checkPagesLowered(0));
        });

        var links = ['projects', 'resume'];
        links.forEach(function (name) {
            it(name, function () {
                return this.remote
                    .then(util.checkLink(name));
            });
        });
    });
});
