import {Foo} from '@tianxia/foo';
import jumbo from './jumbo';

export class Bar {

    constructor(readonly name: string) {
        const foo = new Foo(name);
        const fooName = foo.name;

        // eslint-disable-next-line no-console,@typescript-eslint/restrict-template-expressions
        console.log(`Bar:${jumbo} foo:${fooName}`);
    }

}
