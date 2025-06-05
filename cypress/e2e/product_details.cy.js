describe("Product Details Navigation", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("navigates to a product detail page when clicking a product", () => {
    // Click on the first product article inside the products container
    cy.get(".products article").first().click();

    // After clicking, assert the URL includes /products/ (or whatever your detail path is)
    cy.url().should("include", "/products/");

    // check that product detail content is visible, e.g. product name or description
    cy.get(".product-detail").should("be.visible");
  });
});
