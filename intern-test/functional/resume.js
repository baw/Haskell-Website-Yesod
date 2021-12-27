const { describe, beforeEach, it, b } = intern.getInterface('bdd');
const { expect } = intern.getPlugin('chai');
const util = require('./util');

describe('resumePage', function () {
    beforeEach(function () {
        return this.remote
            .get('http://localhost:3000/resume');
    });

    it('page lowers', function () {
        return this.remote
            .then(util.checkPagesLowered(1, 'resume'));
    });
});