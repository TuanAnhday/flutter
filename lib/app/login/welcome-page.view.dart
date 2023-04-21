import 'package:ai_care/app/app.module.dart';
import 'package:ai_care/resources/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../config/application.dart';
import '../../models/auth/login/login_data.dart';
import '../../resources/validator.dart';
import '../../themes/style.dart';
import '../../utils/responsive.dart';
import '../components/common-button/common-button.component.dart';
import '../components/text-field/text-field.component.dart';
import 'login.cubit.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({required this.account, this.isBack = true, Key? key}) : super(key: key);
  final bool isBack;
  final UserAccount account;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final LoginCubit _cubit = Modular.get<LoginCubit>();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: _cubit,
        listener: (context, state) {
          if (state is LoginError) {
            EasyLoading.dismiss();
            Application.toast.showToastFailed(state.message);
          }

          if (state is Signing) {
            EasyLoading.show();
          }

          if (state is Signed) {
            EasyLoading.dismiss();
          }
        },
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) => Stack(
        children: [
          const Image(image: AssetImage('assets/images/login/login.png')),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: buildLogin(context),
          ),
        ],
      );

  Widget buildLogin(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Text('Login'.i18n, style: const TextStyle(color: Color(0xff1B6086), fontSize: 28, fontWeight: FontWeight.bold)),
            buildLoginWidget(),
          ],
        ),
      );

  Widget buildLoginWidget() => FormBuilder(
        key: _fbKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: AutofillGroup(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFieldView(
                name: 'user_name',
                hintText: 'User name'.i18n,
                validator: FormValidator.userNameValidator(),
                initialValue: (widget.account.userName != null) ? widget.account.userName : null,
                type: FieldType.text,
              ),
              TextFieldView(
                name: 'password',
                hintText: 'Password'.i18n,
                initialValue: Application.sharePreference.getStringList('credentialData')?.elementAt(1),
                validator: FormValidator.passwordValidator(),
                type: FieldType.password,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => launchUrlString('https://hoclieu.vn/auth/forgot-password'),
                  child: Text(
                    'Forgot password'.i18n,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: AppColor.accentColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              BlocBuilder<LoginCubit, LoginState>(
                bloc: _cubit,
                builder: (context, state) {
                  return AbsorbPointer(
                    absorbing: state is Signing,
                    child: CommonButton(
                      radius: 28,
                      backgroundColor: const Color(0xff33779C),
                      onPressed: () async {
                        if (_fbKey.currentState!.saveAndValidate()) {
                          final temp = await _cubit.login(_fbKey.currentState!.value);
                          if (temp) {
                            Modular.to.navigate(AppModule.main);
                          } else {
                            Application.toast.showToastNotification('Wrong User Name or Password'.i18n);
                          }
                        }
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        width: 80.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Login'.i18n,
                              style: TextStyle(color: Colors.white, fontSize: Responsive.isMobile ? 12.sp : 9.sp, fontWeight: FontWeight.w400),
                            ),
                            const Icon(Icons.arrow_forward_outlined, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
}
