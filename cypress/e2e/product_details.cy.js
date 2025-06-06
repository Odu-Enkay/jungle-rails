describe("Product Details Navigation", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("navigates to a product detail page when clicking a product", () => {
    cy.get(".products article").first().click();

   
    cy.url().should("include", "/products/");

  
    cy.get(".product-detail").should("be.visible");
  });
});
