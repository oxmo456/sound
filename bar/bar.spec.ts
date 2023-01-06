import {Bar} from './bar';

describe('Bar', () => {

    it('should pass', () => {
        expect(new Bar('foo').name).toEqual('foo');
    });

});
