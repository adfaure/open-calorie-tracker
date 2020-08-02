Changelog
=========

All notable changes to this project will be documented in this file.
The format is based on `Keep a Changelog`_.

........................................................................................................................

Unreleased
----------

Added
~~~~~

- Can scan food directly from barcode to request openfoodfacts
- Add a profile view, only the Objective parameter is available for the moment.
- Objective can be changed either by clicking on its value on the journal or with the profile view.
- Can change the date of the journal.
- Add a way to add food to a meal on the current journal's date.
- Create food with the number of calories per portion.
- Add table consumedFood to record food ate during a meal.
- Add `moor` ORM framework to manage data, and create the first class `Food` representing a simple "ingredient".

Miscellaneous
~~~~~~~~~~~~~

- Modify `shell_test.nix`, this is now the proper shell to use, at it bundles both flutter and android studio.
  However, the android's SDK is still in a separate folder, managed by android-studio.

.. _Keep a Changelog: http://keepachangelog.com/en/1.0.0/
