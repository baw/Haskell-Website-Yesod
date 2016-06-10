define([
    'intern!tdd',
    'intern/chai!assert',
    './util'
], function (tdd, assert, util) {
    tdd.suite('projectPage', function () {
        tdd.beforeEach(function () {
            return this.remote
                .get('http://localhost:3000/projects');
        });

        tdd.test('page lowers', function () {
            return this.remote
                .then(util.checkPagesLowered(1, 'projects'));
        });
    });
});
