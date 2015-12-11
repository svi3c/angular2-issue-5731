import {Component} from "angular2/angular2";
import {it, describe, expect, inject, TestComponentBuilder} from "angular2/testing";

it("sanity", () => {
  console.log(1);
});


@Component({
  template: ""
})
class TestComponent {
}

describe("inject", () => {
  it("should wait for promises", inject([], () => {
    return new Promise((resolve) => {
      console.log(2);
      setTimeout(resolve);
    });
  }));

  it("should wait for chained promises", inject([], () => {
      return new Promise((resolve) => {
          setTimeout(resolve, 0);
      }).then(() => {
          console.log(3);
      });
  }));
})

describe("TestComponentBuilder", () => {

  describe("createAsync()", () => {
    it("should create a promise", inject([TestComponentBuilder], (tcb) => {
      expect(tcb.createAsync(TestComponent)).toEqual(jasmine.any(Promise));
    }));
  })

});