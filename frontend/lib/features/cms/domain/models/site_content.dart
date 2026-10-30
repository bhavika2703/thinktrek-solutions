import 'package:equatable/equatable.dart';

/// Site-wide content the public pages render and an admin panel can later edit.
class SiteContent extends Equatable {
  const SiteContent({
    required this.brand,
    required this.founder,
    required this.contact,
    required this.navItems,
    required this.home,
    required this.about,
    required this.services,
    required this.contactPage,
  });

  final BrandContent brand;
  final FounderContent founder;
  final ContactDetails contact;
  final List<NavItem> navItems;
  final HomeContent home;
  final AboutContent about;
  final ServicesContent services;
  final ContactPageContent contactPage;

  @override
  List<Object?> get props => [
    brand,
    founder,
    contact,
    navItems,
    home,
    about,
    services,
    contactPage,
  ];
}

class BrandContent extends Equatable {
  const BrandContent({
    required this.name,
    required this.tagline,
    required this.logoUrl,
    required this.location,
  });

  final String name;
  final String tagline;
  final String logoUrl;
  final String location;

  @override
  List<Object?> get props => [name, tagline, logoUrl, location];
}

class FounderContent extends Equatable {
  const FounderContent({
    required this.name,
    required this.title,
    required this.summary,
    required this.education,
    required this.experience,
    required this.volunteer,
  });

  final String name;
  final String title;
  final String summary;
  final List<String> education;
  final List<ExperienceItem> experience;
  final String volunteer;

  @override
  List<Object?> get props => [
    name,
    title,
    summary,
    education,
    experience,
    volunteer,
  ];
}

class ExperienceItem extends Equatable {
  const ExperienceItem({
    required this.role,
    required this.period,
    required this.detail,
  });

  final String role;
  final String period;
  final String detail;

  @override
  List<Object?> get props => [role, period, detail];
}

class ContactDetails extends Equatable {
  const ContactDetails({
    required this.email,
    required this.phones,
    required this.website,
    required this.linkedin,
  });

  final String email;
  final List<String> phones;
  final String website;
  final String linkedin;

  @override
  List<Object?> get props => [email, phones, website, linkedin];
}

class NavItem extends Equatable {
  const NavItem({required this.label, required this.path});

  final String label;
  final String path;

  @override
  List<Object?> get props => [label, path];
}

class PageIntro extends Equatable {
  const PageIntro({
    required this.eyebrow,
    required this.title,
    required this.body,
  });

  final String eyebrow;
  final String title;
  final String body;

  @override
  List<Object?> get props => [eyebrow, title, body];
}

class StatItem extends Equatable {
  const StatItem({required this.value, required this.label});

  final String value;
  final String label;

  @override
  List<Object?> get props => [value, label];
}

class CtaContent extends Equatable {
  const CtaContent({
    required this.title,
    required this.body,
    required this.buttonLabel,
    required this.buttonPath,
  });

  final String title;
  final String body;
  final String buttonLabel;
  final String buttonPath;

  @override
  List<Object?> get props => [title, body, buttonLabel, buttonPath];
}

class HomeContent extends Equatable {
  const HomeContent({
    required this.intro,
    required this.primaryCtaLabel,
    required this.secondaryCtaLabel,
    required this.stats,
    required this.featuredHeading,
    required this.featuredBody,
    required this.cta,
  });

  final PageIntro intro;
  final String primaryCtaLabel;
  final String secondaryCtaLabel;
  final List<StatItem> stats;
  final String featuredHeading;
  final String featuredBody;
  final CtaContent cta;

  @override
  List<Object?> get props => [
    intro,
    primaryCtaLabel,
    secondaryCtaLabel,
    stats,
    featuredHeading,
    featuredBody,
    cta,
  ];
}

class AboutValue extends Equatable {
  const AboutValue({required this.title, required this.body});

  final String title;
  final String body;

  @override
  List<Object?> get props => [title, body];
}

class AboutContent extends Equatable {
  const AboutContent({required this.intro, required this.values});

  final PageIntro intro;
  final List<AboutValue> values;

  @override
  List<Object?> get props => [intro, values];
}

class ServiceItem extends Equatable {
  const ServiceItem({
    required this.id,
    required this.title,
    required this.summary,
    required this.body,
    required this.iconKey,
    this.highlighted = false,
  });

  final String id;
  final String title;
  final String summary;
  final String body;
  final String iconKey;
  final bool highlighted;

  @override
  List<Object?> get props => [id, title, summary, body, iconKey, highlighted];
}

class ProcessStep extends Equatable {
  const ProcessStep({required this.title, required this.body});

  final String title;
  final String body;

  @override
  List<Object?> get props => [title, body];
}

class FaqItem extends Equatable {
  const FaqItem({required this.question, required this.answer});

  final String question;
  final String answer;

  @override
  List<Object?> get props => [question, answer];
}

class ServicesContent extends Equatable {
  const ServicesContent({
    required this.intro,
    required this.items,
    required this.processHeading,
    required this.processSteps,
    required this.faqs,
  });

  final PageIntro intro;
  final List<ServiceItem> items;
  final String processHeading;
  final List<ProcessStep> processSteps;
  final List<FaqItem> faqs;

  List<ServiceItem> get highlighted =>
      items.where((item) => item.highlighted).toList();

  @override
  List<Object?> get props => [intro, items, processHeading, processSteps, faqs];
}

class ContactPageContent extends Equatable {
  const ContactPageContent({
    required this.intro,
    required this.nameLabel,
    required this.emailLabel,
    required this.messageLabel,
    required this.submitLabel,
    required this.successTemplate,
  });

  final PageIntro intro;
  final String nameLabel;
  final String emailLabel;
  final String messageLabel;
  final String submitLabel;
  final String successTemplate;

  @override
  List<Object?> get props => [
    intro,
    nameLabel,
    emailLabel,
    messageLabel,
    submitLabel,
    successTemplate,
  ];
}

class BlogPost extends Equatable {
  const BlogPost({
    required this.id,
    required this.slug,
    required this.title,
    required this.excerpt,
    required this.body,
    required this.publishedAt,
    required this.author,
  });

  final String id;
  final String slug;
  final String title;
  final String excerpt;
  final String body;
  final DateTime publishedAt;
  final String author;

  @override
  List<Object?> get props => [
    id,
    slug,
    title,
    excerpt,
    body,
    publishedAt,
    author,
  ];
}
