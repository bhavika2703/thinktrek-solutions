import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/launch/app_launch.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/app_section_container.dart';
import '../../../core/widgets/cms_scope.dart';
import '../../cms/domain/models/site_content.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();
  var _sent = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _message.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    setState(() => _sent = true);
  }

  @override
  Widget build(BuildContext context) {
    return CmsScope(
      builder: (context, content) {
        final textTheme = Theme.of(context).textTheme;
        final page = content.contactPage;
        final contact = content.contact;

        return AppScaffold(
          body: AppSectionContainer(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(page.intro.eyebrow, style: textTheme.labelMedium),
                  const SizedBox(height: AppSpacing.md),
                  Text(page.intro.title, style: textTheme.displayMedium),
                  const SizedBox(height: AppSpacing.lg),
                  Text(page.intro.body, style: textTheme.bodyLarge),
                  const SizedBox(height: AppSpacing.xl),
                  _ContactDetailsCard(content: content),
                  const SizedBox(height: AppSpacing.xxl),
                  if (_sent)
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.ice,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.lg),
                        child: Text(
                          page.successTemplate.replaceAll(
                            '{name}',
                            _name.text.trim(),
                          ),
                          style: textTheme.titleMedium,
                        ),
                      ),
                    )
                  else
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _name,
                            decoration: InputDecoration(
                              labelText: page.nameLabel,
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please add your name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: AppSpacing.md),
                          TextFormField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: page.emailLabel,
                              hintText: contact.email,
                            ),
                            validator: (value) {
                              if (value == null || !value.contains('@')) {
                                return 'Please add a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: AppSpacing.md),
                          TextFormField(
                            controller: _message,
                            minLines: 4,
                            maxLines: 8,
                            decoration: InputDecoration(
                              labelText: page.messageLabel,
                            ),
                            validator: (value) {
                              if (value == null || value.trim().length < 8) {
                                return 'Tell us a little more';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: AppSpacing.xl),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: AppButton(
                              label: page.submitLabel,
                              onPressed: _submit,
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
      },
    );
  }
}

class _ContactDetailsCard extends StatelessWidget {
  const _ContactDetailsCard({required this.content});

  final SiteContent content;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final contact = content.contact;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${content.founder.name}, ${content.founder.title}',
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(content.brand.location, style: textTheme.bodyMedium),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                TextButton(
                  onPressed: () => launchAppUri(contact.email),
                  child: Text(contact.email),
                ),
                for (final phone in contact.phones)
                  TextButton(
                    onPressed: () => launchAppUri(phone),
                    child: Text(phone),
                  ),
                TextButton(
                  onPressed: () => launchAppUri(contact.linkedin),
                  child: const Text('LinkedIn'),
                ),
                TextButton(
                  onPressed: () => launchAppUri(contact.website),
                  child: const Text('Website'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
