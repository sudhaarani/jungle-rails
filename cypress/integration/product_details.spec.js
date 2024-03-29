
describe('Home page Jungle', () => {
  it('visits home page', () => {
    cy.visit('/')
  })
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  it("can check off an product detail on the page", () => {
    cy.contains('Giant Tea').click();
    // from products => show.html.erb
    cy.get('.products-show').should("be.visible");
    cy.get('.product-detail .main-img');
    cy.get(".product-detail p").should("have.text", "The Giant Tea is an uncommon, medium-sized plant and can be found only in some tundras. It blooms twice a year, for 3 weeks.");
    cy.get('.product-detail .quantity span').should("have.text","0 in stock at $64.99");
  }); 
})