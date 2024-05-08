import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yahtzee/HomePage.dart';

class ValueListenableBuilderTwo<A, B> extends StatelessWidget {
  const ValueListenableBuilderTwo({
    required this.first,
    required this.second,
    super.key,
    required this.builder,
    this.child,
  });

  final ValueListenable<A> first;
  final ValueListenable<B> second;
  final Widget? child;
  final Widget Function(BuildContext context, A a, B b, Widget? child) builder;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<A>(
        valueListenable: first,
        builder: (_, a, __) {
          return ValueListenableBuilder<B>(
            valueListenable: second,
            builder: (context, b, __) {
              return builder(context, a, b, child);
            },
          );
        },
      );
}

class ValueListenableBuilder3<A, B, C> extends StatelessWidget {
  const ValueListenableBuilder3({
    required this.first,
    required this.second,
    required this.third,
    super.key,
    required this.builder,
    this.child,
    required ValueNotifier<List<Player>> valueListenable,
  });

  final ValueListenable<A> first;
  final ValueListenable<B> second;
  final ValueListenable<C> third;
  final Widget? child;
  final Widget Function(BuildContext context, A a, B b, C c, Widget? child) builder;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<A>(
        valueListenable: first,
        builder: (_, a, __) {
          return ValueListenableBuilder<B>(
            valueListenable: second,
            builder: (context, b, __) {
              return ValueListenableBuilder<C>(
                valueListenable: third,
                builder: (context, c, __) {
                  return builder(context, a, b, c, child);
                },
              );
            },
          );
        },
      );
}

class ValueListenableBuilder4<A, B, C, D> extends StatelessWidget {
  const ValueListenableBuilder4({
    required this.first,
    required this.second,
    required this.third,
    required this.fourth,
    super.key,
    required this.builder,
    this.child,
  });

  final ValueListenable<A> first;
  final ValueListenable<B> second;
  final ValueListenable<C> third;
  final ValueListenable<D> fourth;
  final Widget? child;
  final Widget Function(BuildContext context, A a, B b, C c, D d, Widget? child)
      builder;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<A>(
        valueListenable: first,
        builder: (_, a, __) {
          return ValueListenableBuilder<B>(
            valueListenable: second,
            builder: (context, b, __) {
              return ValueListenableBuilder<C>(
                valueListenable: third,
                builder: (context, c, __) {
                  return ValueListenableBuilder<D>(
                    valueListenable: fourth,
                    builder: (context, d, __) {
                      return builder(context, a, b, c, d, child);
                    },
                  );
                },
              );
            },
          );
        },
      );
}
