pg:
	fvm flutter pub get
cg:
	fvm flutter pub run build_runner build --delete-conflicting-outputs
	fvm dart format -l 120 lib  