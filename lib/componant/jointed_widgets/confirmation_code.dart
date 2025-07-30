
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hacathon_app/componant/utils/app_text.dart';

class ConfimationCode extends StatelessWidget {
  const ConfimationCode({
    super.key,
    required this.focusNodes,
  });

  final List<FocusNode> focusNodes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 5,
        crossAxisSpacing: 10,
        mainAxisExtent: 60,
      ),
      itemBuilder: (context, index) {
        return Container(
          child: TextFormField(
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter Pin Code";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly], // 3lshan el input ykon arkam bs
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                  ),
                  hintText: "*",
                  hintStyle: AppText.style24w700(context),
                  counterText: '' // by5ly t7t el morb3 mfysh rakam
                ),
                maxLength: 1,
                // controller: value.opts[index],
                focusNode: focusNodes[index],
                onChanged: (value) {
                  if (value.isNotEmpty && index < 3) {
                    FocusScope.of(
                      context,
                    ).requestFocus(focusNodes[index + 1]);
                  } else if (value.isEmpty && index > 0) {
                    FocusScope.of(
                      context,
                    ).requestFocus(focusNodes[index - 1]);
                  }
                },
              )
        );
      },
    );
  }
}