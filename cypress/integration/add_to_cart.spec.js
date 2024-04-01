
describe('Home page Jungle', () => {
  it('visits home page by default', () => {
    cy.visit('/')
  })
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  it("can check off the count of the cart changes when adding products to it", () => {
    // from products => _product.html.erb
    cy.get('.products article').first().find('.btn').click({force: true});
    cy.contains('My Cart (1)').should('exist');
  }); 
})