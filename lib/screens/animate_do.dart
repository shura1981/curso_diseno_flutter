import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AnimateDoScreen extends StatelessWidget {
  const AnimateDoScreen({Key? key}) : super(key: key);

  static const String nameRoute = '/animate_do';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
            duration: const Duration(milliseconds: 2000),
            child: const Text('AnimateDo')),
        actions: [
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.twitter)),
          IconButton(
              onPressed: () {
                final route = MaterialPageRoute(
                    builder: (context) => const NotificationScreen());
                Navigator.push(context, route);
              },
              icon: const FaIcon(FontAwesomeIcons.forward)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
                delay: const Duration(milliseconds: 1100),
                child: const Icon(Icons.new_releases,
                    size: 70, color: Colors.blue)),
            FadeInDown(
                delay: const Duration(milliseconds: 200),
                child: const Text(
                  'Título',
                  style: TextStyle(fontSize: 40),
                )),
            FadeInDown(
                delay: const Duration(milliseconds: 800),
                child: const Text('Subtítulo')),
            Container(
              width: 220,
              height: 2,
              color: Colors.blue,
            ),
          ],
        ),
      ),
      floatingActionButton: ElasticInLeft(
        child: FloatingActionButton(
          onPressed: () {
            final route = MaterialPageRoute(
                builder: (context) => GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const TwitterPage()));
            Navigator.push(context, route);
          },
          child: const FaIcon(FontAwesomeIcons.play),
        ),
      ),
    );
  }
}

class Square extends StatelessWidget {
  const Square({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: const Color(0xff67549B),
    );
  }
}

class TwitterPage extends StatefulWidget {
  const TwitterPage({super.key});

  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  late final AnimationController animateController;

  @override
  void initState() {
// esperar 2 segundos y disparar la animación mediante el controlador
    Future.delayed(const Duration(milliseconds: 500), () {
      animateController.forward();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
          // (optional) if true, will not fire the animation on load
          manualTrigger: true,
          controller: (controller) => animateController = controller,
          from: 30,
          duration: const Duration(milliseconds: 1000),
          child: const FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 40,
          ),
          onFinish: (direction) {
            animateController.reverse();
            // devolver la animación
          },
        ),
      ),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {

  
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: FadeIn(
              duration: const Duration(milliseconds: 500),
              child: const Text('Notificaciones')),
        ),
        body: Container(),
        bottomNavigationBar: const BottomNavigation(),
        floatingActionButton: const BotonFlotante(),
      ),
    );
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
                final provider = Provider.of<_NotificationModel>(context,
                      listen: false);
                  provider.increment();
      },
      child: const FaIcon(FontAwesomeIcons.play),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: const Color.fromARGB(255, 53, 53, 53),
      items: [
          BottomNavigationBarItem(
          icon: Stack(
            children: [
              const FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: Consumer(
                  builder: (context, _NotificationModel value, child) {
                    return Container(
                      width: 14,
                      height: 14,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Text(value._number.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 7)),
                    );
                  }
                ),
              )
            ],
          ),
          label: 'Notificaciones',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Calendario',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.bubble_chart),
          label: 'Gráficos',
        ),
      
        const BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle),
          label: 'Usuarios',
        ),
      ],
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _number = 0;
  int get number => _number;

  void increment() {
    _number++;
    notifyListeners();
  }

  void setNumber(int value) {
    _number = value;
    notifyListeners();
  }
}
