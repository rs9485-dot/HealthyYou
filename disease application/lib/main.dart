import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const DiseaseApp());
}

class DiseaseApp extends StatelessWidget {
  const DiseaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    // WhatsApp-like primary green
    const whatsappGreen = Color(0xFF25D366);
    final colorScheme = ColorScheme.fromSeed(
      seedColor: whatsappGreen,
      brightness: Brightness.light,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HealthyYou',
      theme: ThemeData(
        colorScheme: colorScheme,
        scaffoldBackgroundColor: const Color(0xFFF5FFF8),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFFFF3E0), // soft orange
              const Color(0xFFE1F5FE), // soft blue
              const Color(0xFFE8F5E9), // soft green accent
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 16),
              _Logo(),
              const _YogaIllustration(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Your colourful\nhealth companion',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: const Color(0xFF075E54),
                          ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Personalised yoga and diet guidance for every patient, step by step.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black87),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF25D366),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const OnboardingFormPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Get started',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        'Takes less than a minute',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.black87,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF25D366), Color(0xFF128C7E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(
            Icons.self_improvement,
            size: 56,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'HealthyYou',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF075E54),
                letterSpacing: 0.5,
              ),
        ),
      ],
    );
  }
}

class _YogaIllustration extends StatefulWidget {
  const _YogaIllustration();

  @override
  State<_YogaIllustration> createState() => _YogaIllustrationState();
}

class _YogaIllustrationState extends State<_YogaIllustration>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: -8, end: 8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: const LinearGradient(
            colors: [Color(0xFFB3E5FC), Color(0xFFC8E6C9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.accessibility_new_rounded,
              size: 80,
              color: Color(0xFF25D366),
            ),
            const SizedBox(height: 16),
            Text(
              'Gentle animated poses\nfor easier learning.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF075E54),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingFormPage extends StatefulWidget {
  const OnboardingFormPage({super.key});

  @override
  State<OnboardingFormPage> createState() => _OnboardingFormPageState();
}

class _OnboardingFormPageState extends State<OnboardingFormPage> {
  final _pageController = PageController();
  int _currentStep = 0;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  String? _gender;
  String? _emailError;
  String? _occupation;

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _next() {
    // Basic email validation on first step
    if (_currentStep == 0) {
      final email = _emailController.text.trim();
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
      if (email.isEmpty || !emailRegex.hasMatch(email)) {
        setState(() {
          _emailError = 'Please enter a valid email address';
        });
        return;
      } else {
        setState(() {
          _emailError = null;
        });
      }
    }

    if (_currentStep < 3) {
      setState(() {
        _currentStep++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => DiseasePage(
            name: _nameController.text.trim().isEmpty
                ? 'Patient'
                : _nameController.text.trim(),
            age: _ageController.text.trim(),
            weightKg: _weightController.text.trim(),
            occupation: _occupation ?? 'Not specified',
          ),
        ),
      );
    }
  }

  void _back() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final steps = ['Basic', 'Body', 'Gender', 'Work'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tell us about you'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                steps.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 6,
                  width: index == _currentStep ? 32 : 14,
                  decoration: BoxDecoration(
                    color: index <= _currentStep
                        ? const Color(0xFF25D366)
                        : const Color(0xFFB9F6CA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Step ${_currentStep + 1} of ${steps.length}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildBasicInfoStep(context),
                  _buildBodyInfoStep(context),
                  _buildGenderStep(context),
                  _buildOccupationStep(context),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  TextButton(
                    onPressed: _back,
                    child: const Text('Back'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF25D366),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: _next,
                    child: Text(_currentStep == 2 ? 'Finish' : 'Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicInfoStep(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Basic details',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              border: const OutlineInputBorder(),
              errorText: _emailError,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyInfoStep(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Body details',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Height (cm)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _weightController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Weight (kg)',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderStep(BuildContext context) {
    final genders = ['Female', 'Male', 'Other'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gender',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            children: genders
                .map(
                  (g) => ChoiceChip(
                    label: Text(g),
                    selected: _gender == g,
                    onSelected: (selected) {
                      setState(() {
                        _gender = selected ? g : null;
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildOccupationStep(BuildContext context) {
    final occupations = [
      'Student',
      'Office worker',
      'Soldier',
      'Athlete',
      'Homemaker',
      'Retired',
      'Other',
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your daily work',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text(
            'This helps us understand your stamina and recommend better poses.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: occupations
                .map(
                  (job) => ChoiceChip(
                    label: Text(job),
                    selected: _occupation == job,
                    onSelected: (selected) {
                      setState(() {
                        _occupation = selected ? job : null;
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class DiseasePage extends StatefulWidget {
  const DiseasePage({
    super.key,
    required this.name,
    required this.age,
    required this.weightKg,
    required this.occupation,
  });

  final String name;
  final String age;
  final String weightKg;
  final String occupation;

  @override
  State<DiseasePage> createState() => _DiseasePageState();
}

class _DiseasePageState extends State<DiseasePage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _knownDiseases = [
    'Diabetes',
    'Hypertension',
    'Asthma',
    'Back Pain',
    'Arthritis',
    'Anxiety',
    'Depression',
    'PCOS',
    'Obesity',
    'Thyroid disorder',
    'Migraine',
    'Heart disease',
    'Chronic fatigue',
    'Knee pain',
    'Neck pain',
  ];

  String? _selectedDisease;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _knownDiseases
        .where(
          (d) => d.toLowerCase().contains(_searchController.text.toLowerCase()),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your disease space'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: const Color(0xFF25D366),
                    child: Text(
                      widget.name.isNotEmpty ? widget.name[0].toUpperCase() : 'P',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.age.isNotEmpty ? '${widget.age} yrs' : 'Age not set',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.weightKg.isNotEmpty
                            ? '${widget.weightKg} kg'
                            : 'Weight not set',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search your disease',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      onChanged: (_) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    itemBuilder: (context) {
                      return _knownDiseases
                          .map(
                            (d) => PopupMenuItem(
                              value: d,
                              child: Text(d),
                            ),
                          )
                          .toList();
                    },
                    onSelected: (value) {
                      setState(() {
                        _selectedDisease = value;
                        _searchController.text = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            if (_searchController.text.isNotEmpty &&
                !_knownDiseases
                    .map((d) => d.toLowerCase())
                    .contains(_searchController.text.toLowerCase()))
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline, color: Colors.deepOrange),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Disease not found in list. We will still personalise yoga and diet using AI suggestions.',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final disease = filtered[index];
                  final selected = disease == _selectedDisease;
                  return Card(
                    color: selected ? const Color(0xFFE8F5E9) : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      title: Text(disease),
                      onTap: () {
                        setState(() {
                          _selectedDisease = disease;
                          _searchController.text = disease;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF25D366),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: _searchController.text.trim().isEmpty
                      ? null
                      : () {
                          final disease = _searchController.text.trim();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => RecommendationPage(
                                name: widget.name,
                                disease: disease,
                                age: widget.age,
                                weightKg: widget.weightKg,
                                occupation: widget.occupation,
                              ),
                            ),
                          );
                        },
                  child: const Text(
                    'Get personalised plan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecommendationPage extends StatelessWidget {
  const RecommendationPage({
    super.key,
    required this.name,
    required this.disease,
    required this.age,
    required this.weightKg,
    required this.occupation,
  });

  final String name;
  final String disease;
  final String age;
  final String weightKg;
  final String occupation;

  int get _ageValue => int.tryParse(age) ?? 30;
  double get _weightValue => double.tryParse(weightKg) ?? 60;
  bool get _isHighStamina =>
      occupation.toLowerCase().contains('soldier') ||
      occupation.toLowerCase().contains('athlete');

  List<String> _recommendedPoses() {
    // Simple age/weight aware selection
    final lower = disease.toLowerCase();
    final isSenior = _ageValue >= 60;
    final isChild = _ageValue <= 12;
    final isHeavy = _weightValue >= 80;

    if (lower.contains('diab')) {
      if (isSenior || isHeavy) {
        return ['Tadasana', 'Vrikshasana (with wall)', 'Seated forward bend', 'Shavasana'];
      }
      return ['Tadasana', 'Trikonasana', 'Bhujangasana', 'Vrikshasana'];
    }
    if (lower.contains('hyper') || lower.contains('bp') || lower.contains('heart')) {
      return [
        'Balasana',
        'Setu Bandhasana',
        'Viparita Karani',
        'Shavasana',
      ];
    }
    if (lower.contains('back') || lower.contains('neck') || lower.contains('knee')) {
      if (isSenior || isHeavy) {
        return [
          'Cat–Cow (on mat)',
          'Sphinx pose',
          'Child’s pose with support',
          'Supine twist',
        ];
      }
      return [
        'Marjaryasana-Bitilasana (Cat–Cow)',
        'Adho Mukha Svanasana',
        'Sphinx pose',
        'Bridge pose',
      ];
    }
    if (lower.contains('asthma')) {
      return ['Easy pose with breathing', 'Bhujangasana', 'Bridge pose', 'Shavasana'];
    }
    if (lower.contains('anxiety') || lower.contains('depress')) {
      return ['Child’s pose', 'Forward fold', 'Legs up the wall', 'Shavasana'];
    }
    if (lower.contains('pcos') || lower.contains('thyroid')) {
      return ['Butterfly pose', 'Bridge pose', 'Cobra pose', 'Cat–Cow'];
    }

    if (isChild) {
      return ['Butterfly pose', 'Tree pose', 'Cat–Cow', 'Happy baby pose'];
    }
    if (isSenior) {
      return ['Chair pose (supported)', 'Seated twist', 'Ankle rotations', 'Shavasana'];
    }

    if (_isHighStamina) {
      return [
        'Surya Namaskar (gentle)',
        'Warrior II',
        'Chair pose',
        'Plank (short hold)',
      ];
    }

    return ['Tadasana', 'Vrikshasana', 'Bhujangasana', 'Shavasana'];
  }

  List<Map<String, dynamic>> _dietPlan() {
    // very rough example protein grams; not medical advice
    final lower = disease.toLowerCase();
    double baseProteinPerKg = 0.8;
    if (lower.contains('diab') || lower.contains('pcos')) {
      baseProteinPerKg = 1.0;
    } else if (lower.contains('obes') || lower.contains('heart')) {
      baseProteinPerKg = 0.9;
    }
    final targetProtein = (_weightValue * baseProteinPerKg).clamp(40, 100).round();

    return [
      {
        'title': 'Breakfast: dal / egg & whole grain',
        'detail': 'Lentils or 2 eggs + whole grain roti/bread + fruit.',
        'protein': '${(targetProtein * 0.35).round()} g protein',
      },
      {
        'title': 'Lunch: balanced plate',
        'detail': '1/2 plate veggies, 1/4 dal/beans/paneer, 1/4 rice/roti.',
        'protein': '${(targetProtein * 0.4).round()} g protein',
      },
      {
        'title': 'Snacks: nuts & fruit',
        'detail': 'Handful of nuts / seeds + 1 seasonal fruit.',
        'protein': '${(targetProtein * 0.15).round()} g protein',
      },
      {
        'title': 'Dinner: light & early',
        'detail': 'Soup / dal with veggies + small portion of grains.',
        'protein': '${(targetProtein * 0.1).round()} g protein',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final poses = _recommendedPoses();
    final diet = _dietPlan();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your yoga & diet'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFC107), Color(0xFFFF80AB)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi $name,',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'this plan is shaped for\n"$disease".',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Yoga poses',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              ...poses.map(
                (pose) => _AnimatedPoseCard(
                  poseName: pose,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => PoseDetailPage(poseName: pose),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Diet & nutrients',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              ...diet.map(
                (item) => Card(
                  color: const Color(0xFFE8F5E9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.restaurant, color: Colors.green),
                    title: Text(item['title'] as String),
                    subtitle: Text(
                      '${item['detail']} \nProtein: ${item['protein']}',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Affirmation: Every day I am getting a little stronger and healthier.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: const Color(0xFF075E54),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedPoseCard extends StatefulWidget {
  const _AnimatedPoseCard({
    required this.poseName,
    required this.onTap,
  });

  final String poseName;
  final VoidCallback onTap;

  @override
  State<_AnimatedPoseCard> createState() => _AnimatedPoseCardState();
}

class _AnimatedPoseCardState extends State<_AnimatedPoseCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: -6, end: 6).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        color: const Color(0xFFE8F5E9),
        child: ListTile(
          leading: GestureDetector(
            onTap: widget.onTap,
            child: const Icon(
              Icons.self_improvement,
              color: Color(0xFF25D366),
              size: 32,
            ),
          ),
          title: Text(widget.poseName),
          subtitle: const Text('Tap to see full animation and steps.'),
          onTap: widget.onTap,
        ),
      ),
    );
  }
}

class PoseDetailPage extends StatefulWidget {
  const PoseDetailPage({super.key, required this.poseName});

  final String poseName;

  @override
  State<PoseDetailPage> createState() => _PoseDetailPageState();
}

class _PoseDetailPageState extends State<PoseDetailPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: -20, end: 20).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String positionText;
    if (widget.poseName.toLowerCase().contains('seated') ||
        widget.poseName.toLowerCase().contains('sitting') ||
        widget.poseName.toLowerCase().contains('pose') &&
            widget.poseName.toLowerCase().contains('child')) {
      positionText = 'Sit or kneel comfortably for this pose.';
    } else if (widget.poseName.toLowerCase().contains('supine') ||
        widget.poseName.toLowerCase().contains('shavasana') ||
        widget.poseName.toLowerCase().contains('lying')) {
      positionText = 'Lie down gently on your mat for this pose.';
    } else {
      positionText = 'Stand tall with feet stable on the floor.';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.poseName),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: GestureDetector(
                  onTap: _openVideo,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _animation.value),
                        child: child,
                      );
                    },
                    child: Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFFF3E0), Color(0xFFE8F5E9)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Icon(
                        Icons.play_circle_fill,
                        color: Color(0xFF25D366),
                        size: 140,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '$positionText\n\nBreathe in slowly through your nose as the body lifts, and breathe out as it relaxes back down.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF25D366),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: _openVideo,
                icon: const Icon(Icons.ondemand_video),
                label: const Text('Watch 15s YouTube demo'),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Future<void> _openVideo() async {
    final uri = _videoUrlForPose(widget.poseName);
    if (!await launchUrl(Uri.parse(uri), mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open video link')),
        );
      }
    }
  }

  String _videoUrlForPose(String poseName) {
    final key = poseName.toLowerCase();
    if (key.contains('tadasana')) {
      // Short Tadasana / mountain pose demo
      return 'https://youtube.com/shorts/Xof9Fv7gkqw?si=FO2TSvzGjdlDYCJ1';
    }
    if (key.contains('vrikshasana') || key.contains('tree')) {
      return 'https://youtube.com/shorts/pfF98CIsd0E?si=L8-JQ10nXt9KoULo';
    }
    if (key.contains('bhujangasana') || key.contains('cobra pose')) {
      return 'https://youtube.com/shorts/qK7sEV08F_E?si=Wo5QwcsMa7RWP8NF';
    }
    if (key.contains('shavasana')) {
      // Dedicated short Shavasana / relaxation demo
      return 'https://youtube.com/shorts/9ZsTLblha9o?si=m-5qtAcDVfwDD1AL';
    }
    if (key.contains('cat–cow') || key.contains('marjaryasana-Bitilasana (Cat-Cow)')) {
      return 'https://youtube.com/shorts/2of247Kt0tU?si=tbKFI7SgRgQmGoow';
    }
    if (key.contains('balasana') || key.contains('child')) {
      return 'https://youtube.com/shorts/YAmAET3Uomk?si=yVGkDZP2wls8N6pj';
    }
    if (key.contains('surya') || key.contains('sun salutation')) {
      return 'https://youtube.com/shorts/8XLBpKnWYww?si=bAI7FO-ojKuBhAzl';
    }
    if (key.contains('warrior ii') || key.contains('warrior 2')) {
      return 'https://youtube.com/shorts/vxvLxyahNOA?si=JpJycbonaM7-whYC';
    }
    if (key.contains('plank')) {
      return 'https://youtube.com/shorts/E-PBfoIMc-0?si=hp1JdnqbsglNh6xR';
    }
    if (key.contains('chair pose')) {
      return 'https://youtube.com/shorts/SStBS_CUYDw?si=uwTi5CrBFv7Cr1HP';
    }  
    if (key.contains('seated forward bend')) {
      return 'https://youtube.com/shorts/wVdOp3h1nog?si=VBVl_pAmY5hp7Wr7';
    }  
    if (key.contains('setu bandhasana')) {
      return 'https://youtube.com/shorts/fG6uUKbQbws?si=wI_5UZuXo-x_yY81';
    }   
    if (key.contains('viparita karani') || key.contains('legs up the wall') {
      return 'https://youtube.com/shorts/qlhIBx-jY2M?si=RepORQnkkBO-NCAv';
    }   
    if (key.contains('setu bandhasana') || key.contains('bridge pose')) {
      return 'https://youtube.com/shorts/fG6uUKbQbws?si=wI_5UZuXo-x_yY81';
    }   
    if (key.contains('easy pose with breathing')) {
      return 'https://youtube.com/shorts/m6Dys1buXlU?si=lATe2Wnv754_8HAY';
    }   
    if (key.contains('sphinx pose')) {
      return 'https://youtube.com/shorts/vo1V3Q-PD78?si=kQ38g1_JeIC7xur2';
    }   
    if (key.contains('Child's pose with support') || key.contains('Child's pose') {
      return 'https://youtube.com/shorts/YAmAET3Uomk?si=SsJsDrdH68bsc0Zq';
    }   
    if (key.contains('supine twist') || key.contains('seated twist')) {
      return 'https://youtube.com/shorts/tAv9nInGsi4?si=GFC5uXu1zFLc-gvV';
    }   
    if (key.contains('forward fold')) {
      return 'https://youtube.com/shorts/xM5eh_NrZzw?si=A1K-v9R_rtGh3h6z';
    }   
        if (key.contains('butterfly pose')) {
      return 'https://youtube.com/shorts/fUGoCRCn_6A?si=Uso9_gpT1ZcLWrDn';
    }   
    if (key.contains('Adho Mukha Svanasana')) {
      return 'https://youtube.com/shorts/mOr8GCo5rHU?si=rzeUlE-_wafrTJCc';
    }   
    // Fallback general short yoga demo
    return 'https://www.youtube.com/watch?v=v7AYKMP6rOE';
  }
}
