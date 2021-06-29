# test_beamer_bloc

A quick Flutter application to test Bloc/Beamer interaction.
When transitioning out of a location (while overriding builder) with a Bloc, it will rebuild the original page without the Bloc, and throw an exception.

Issue in question:
https://github.com/slovnicki/beamer/issues/328
