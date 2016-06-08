define([
    'intern!tdd',
    'intern/chai!assert',
    './util'
], function (tdd, assert, util) {
    tdd.suite('resumePage', function () {
        tdd.test('page lowers', function () {
            return this.remote
                .then(util.checkPagesLowered(1, 'resume'));
        });
    });
});
