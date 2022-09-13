import 'package:flutter/material.dart';

@immutable
abstract class PaymentMethodState {}

class PaymentMethodInitial extends PaymentMethodState {}

class BeforeChangePaymentMethod extends PaymentMethodState {}

class ChangePaymentMethod extends PaymentMethodState {}
