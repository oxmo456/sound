export class Foo {

    constructor(readonly name: string) {
    }

    get nom(): string {
        return this.name;
    }

}
