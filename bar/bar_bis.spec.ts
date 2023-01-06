import {Bar} from './bar';

describe('Bar', () => {

    it('should be instantiatable', () => {
        expect(new Bar('foo')).toBeTruthy();
    });

});
