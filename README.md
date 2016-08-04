# Alicorn Adoption

### Introduction

Alicorn Adoption was conceived as a final project for the Little Shop of Orders Assignment in module 2 of the Turing School curriculum. The site serves as a storefront to adopt mythical creatures in the wild. A user can browse through creatures and add them to a shopping cart. They can view creatures by category or search by name. The creatures in a cart persist over the user's browsing session. When a user checks out, they are prompted to create an account or log in. Payment is completed via Stripe. 

### Features

Alicorn Adoption displays several topics which were covered during the Turing Module 2 curriculum. These include MVC architecture using Rails, database transactions and logic operations using ActiveRecord, user authorization, user authentication, and building a functional shopping cart for single browsing sessions.

The site uses different controllers for users based on their admin privileges. This allows for a variety of methods to be restricted based on user status. Admins, for example, can add more creatures to the site. They can retire creatures which are no longer able to be adopted. They can also modify their own information, and delete their account if they choose. 

All users are able to create accounts with a unique username and email address. Current admins may assign other users to be admins. Regardless of user type, users are able to see all their past orders. All visitors and users can fill a shopping cart with creatures to adopt, but only registered and logged-in users are allowed to check out. 

### Build Process

The site was built according to user stories which were revealed over the course of three different client meetings. This resulted in a code base which required many changes in the course of development. Database migrations, controller changes, and styling adjustments were commonplace throughout the assignment. Good Git workflow across the team members was encouraged and judged as part of the evaluation criteria. 

### Extensions

Several features were implemented which were not part of the core curriculum. These include accepting payment from a third-party source. Paypal inclusion was attempted initially, but Stripe lasted as the chosen method for third-party payment validation. Playing music on the site was a minor add-on feature. Lastly, the use of jQuery to allow real-time updating of features without page refreshing was added where it seemed sensible. One example of this is the real-time updating of creature search results on the root path.

### Conclusion

This project provided avenues to so much learning. Please enjoy browsing and building on the work and ideas. 