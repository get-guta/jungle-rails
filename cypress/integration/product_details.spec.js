
describe('Jungle App Home Page', () => {
  it('Visits the home page and checks the title section', () => {
    cy.visit('http://localhost:3000/'); 
    cy.get('section.title').should('be.visible'); 
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });
});
