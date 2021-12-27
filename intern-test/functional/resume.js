const { describe, beforeEach, it, b } = intern.getInterface('bdd');
const { expect } = intern.getPlugin('chai');
const util = require('./util');

describe('resumePage', function () {
    beforeEach(function ({ remote }) {
        return remote
            .get('http://localhost:3000/resume');
    });

    it('page lowers', function ({ remote }) {
        return remote
            .then(util.checkPagesLowered(1, 'resume'));
    });
});