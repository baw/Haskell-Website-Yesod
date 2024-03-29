const { describe, beforeEach, it, b } = intern.getInterface('bdd');
const { expect } = intern.getPlugin('chai');
const util = require('./util');

describe('projectPage', function () {
    beforeEach(function ({ remote }) {
        return remote
            .get('http://localhost:3000/projects');
    });

    it('page lowers', function ({ remote }) {
        return remote
            .then(util.checkPagesLowered(remote, 1, 'projects'));
    });
});
