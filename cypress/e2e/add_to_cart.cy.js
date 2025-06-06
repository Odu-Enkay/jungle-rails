describe('Home Page', () => {
  it('should visit the home page', () => {
    cy.visit('/');
    cy.wait(2000);

    cy.get(".products article").first().within(() => {
      cy.contains('Add').click({force:true});
    });

    cy.wait(2000);
    cy.visit('/cart');

    cy.wait(2000);
    cy.get('.cart-show').should("be.visible");
    cy.get('.cart-show').should('contain', 'Scented Blade');

  });
});