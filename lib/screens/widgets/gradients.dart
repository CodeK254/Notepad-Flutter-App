import 'package:flutter/material.dart';

LinearGradient outterGradient = const LinearGradient(
  colors: [Color(0xFF48CDF4), Color(0xFFEA9DD3)],
  stops: [0.0, 1.0],
  begin: AlignmentDirectional(1.0, -0.34),
  end: AlignmentDirectional(-1.0, 0.34),
);

LinearGradient innerGradient = const LinearGradient(
  colors: [Color(0xFFC1E6F0), Color(0xFFEA9DD3)],
  // stops: [0.0, 1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient appbargradient = const LinearGradient(
  colors: [Color(0xFF48CDF4), Color(0xFFEA9DD3)],
  stops: [0.0, 1.0],
  end: AlignmentDirectional(1.0, -0.34),
  begin: AlignmentDirectional(-1.0, 0.34),
);

LinearGradient bootomnavgradient = const LinearGradient(
  colors: [Color.fromARGB(255, 50, 199, 244), Color.fromARGB(255, 246, 113, 206)],
  // stops: [0.0, 1.0],
  begin: AlignmentDirectional(1.0, -0.34),
  end: AlignmentDirectional(-1.0, 0.34),
);
