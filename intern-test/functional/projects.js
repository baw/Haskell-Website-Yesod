const { describe, beforeEach, it, b } = intern.getInterface('bdd');
const { expect } = intern.getPlugin('chai');
const util = require('./util');

describe('projectPage', function () {
    beforeEach(function () {
        return this.remote
            .get('http://localhost:3000/projects');
    });

    it('page lowers', function () {
        return this.remote
            .then(util.checkPagesLowered(1, 'projects'));
    });
});
