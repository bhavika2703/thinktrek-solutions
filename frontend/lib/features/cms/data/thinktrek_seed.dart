import '../../../core/constants/app_constants.dart';
import '../domain/models/site_content.dart';

/// Default content until the admin CMS writes over it.
abstract final class ThinktrekSeed {
  static const founderName = 'Rajendra Pal';

  static final site = SiteContent(
    brand: const BrandContent(
      name: 'ThinkTrek Solutions',
      tagline: 'Certification consulting, with care.',
      logoUrl: AppAssets.logo,
      location: 'Navsari, Gujarat, India',
    ),
    founder: const FounderContent(
      name: founderName,
      title: 'Founder & CEO',
      summary:
          'Rajendra Pal founded ThinkTrek Solutions in June 2015 in Navsari. '
          'The practice covers management consulting, ISO and ISI / BIS '
          'certification consulting, corporate soft-skill training, and '
          'website design and development.',
      education: [
        'Bachelor of Commerce — specialisation in Accountancy',
        'Master of Public Administration (MPA) — Human Resource Management',
      ],
      experience: [
        ExperienceItem(
          role: 'Founder / CEO, ThinkTrek Solutions',
          period: 'June 2015 – Present',
          detail:
              'Leads business support services: management consulting, '
              'corporate soft-skill training, ISO and ISI certification '
              'consulting, and IT services including website and software '
              'solutions.',
        ),
        ExperienceItem(
          role: 'Management consultant / trainer',
          period: 'August 2010 – May 2015',
          detail:
              'Branch management with responsibility for ISO consulting, '
              'management consulting across industry and service providers, '
              'and soft-skill training — including programmes for students.',
        ),
        ExperienceItem(
          role: 'Owner, coaching class',
          period: 'June 2007 – April 2011',
          detail:
              'Part-time coaching for secondary and higher-secondary students. '
              'First independent teaching practice.',
        ),
      ],
      volunteer:
          'Delivers entrepreneurship and soft-skill training in remote and '
          'underserved areas, in partnership with NGOs.',
    ),
    contact: const ContactDetails(
      email: 'info@thinktreksolutions.in',
      phones: ['+91 99742 26542', '+91 94269 86542'],
      website: 'https://www.thinktreksolutions.in',
      linkedin: 'https://www.linkedin.com/in/thinktreksolutions',
    ),
    navItems: const [
      NavItem(label: 'Home', path: AppRoutes.home),
      NavItem(label: 'About', path: AppRoutes.about),
      NavItem(label: 'Services', path: AppRoutes.services),
      NavItem(label: 'Blog', path: AppRoutes.blog),
      NavItem(label: 'Contact', path: AppRoutes.contact),
    ],
    home: const HomeContent(
      intro: PageIntro(
        eyebrow: 'BIS · ISO · CONSULTING · TRAINING',
        title: 'ThinkTrek Solutions',
        body:
            'Consulting for BIS licence (ISI mark) and related Indian '
            'approvals, plus ISO, management consulting, soft-skill training, '
            'and websites — led by Rajendra Pal from Navsari.',
      ),
      primaryCtaLabel: 'Request BIS consultation',
      secondaryCtaLabel: 'View services',
      stats: [
        StatItem(value: '2015', label: 'Practice founded in Navsari'),
        StatItem(value: 'ISI / BIS', label: 'Licence consulting highlight'),
        StatItem(value: 'End-to-end', label: 'Application to grant support'),
      ],
      featuredHeading: 'How we can help',
      featuredBody:
          'Certification, systems, people, and a working website — one '
          'studio, one point of contact.',
      cta: CtaContent(
        title: 'Need an ISI mark or ISO path?',
        body:
            'Tell us the product or process. We will confirm the scheme, '
            'the documents, and a clear next step.',
        buttonLabel: 'Talk to ThinkTrek',
        buttonPath: AppRoutes.contact,
      ),
    ),
    about: const AboutContent(
      intro: PageIntro(
        eyebrow: 'ABOUT',
        title: 'A Navsari practice for standards, systems, and skills.',
        body:
            'ThinkTrek Solutions is the consulting studio of Rajendra Pal — '
            'Founder and CEO since 2015. We help manufacturers, importers, '
            'and growing teams meet Indian certification requirements and '
            'run calmer operations.',
      ),
      values: [
        AboutValue(
          title: 'Clarity first',
          body:
              'We confirm which standard and scheme apply before any filing '
              'starts.',
        ),
        AboutValue(
          title: 'Stay through grant',
          body:
              'Application, testing coordination, inspection readiness, and '
              'follow-up until the licence is in hand.',
        ),
        AboutValue(
          title: 'Teach as we go',
          body:
              'Soft-skill and management training so the system lives with '
              'your people, not only in a binder.',
        ),
      ],
    ),
    services: const ServicesContent(
      intro: PageIntro(
        eyebrow: 'SERVICES',
        title: 'Consulting for BIS licence, ISO, and business support.',
        body:
            'The highlighted service is BIS licence consulting for ISI mark '
            'certification. Around it: FMCS, CRS, EPR, LMPC, ISO, management '
            'consulting, training, and web development.',
      ),
      items: [
        ServiceItem(
          id: 'bis-isi',
          title: 'Consulting for BIS licence (ISI mark certification)',
          summary:
              'End-to-end support for Indian manufacturers seeking an ISI '
              'mark licence under the Bureau of Indian Standards.',
          body:
              'We identify the applicable Indian Standard, prepare the '
              'application and plant documents, coordinate testing at a '
              'recognised laboratory, ready the factory for inspection, and '
              'follow the file through to grant and surveillance.',
          iconKey: 'verified',
          highlighted: true,
        ),
        ServiceItem(
          id: 'fmcs',
          title: 'FMCS for foreign manufacturers',
          summary:
              'Foreign Manufacturers Certification Scheme support for plants '
              'outside India that need an ISI mark to sell here.',
          body:
              'Guidance on authorised Indian representation, documentation, '
              'testing, and inspection so overseas factories can enter the '
              'Indian market on a licensed product.',
          iconKey: 'public',
        ),
        ServiceItem(
          id: 'crs',
          title: 'BIS CRS registration',
          summary:
              'Compulsory Registration Scheme filings for electronics and IT '
              'products.',
          body:
              'We map the product to the correct CRS order, assemble the '
              'test reports and company papers, and manage queries until '
              'registration is issued.',
          iconKey: 'devices',
        ),
        ServiceItem(
          id: 'epr',
          title: 'EPR certification',
          summary:
              'Extended Producer Responsibility support for plastic, battery, '
              'and related waste rules.',
          body:
              'Registration and ongoing compliance so producers and importers '
              'meet environmental obligations on time.',
          iconKey: 'eco',
        ),
        ServiceItem(
          id: 'lmpc',
          title: 'LMPC certification',
          summary:
              'Legal Metrology (Packaged Commodities) filings for labelled, '
              'packed goods.',
          body:
              'Help with declarations, registrations, and packaging checks '
              'required to sell packaged commodities in India.',
          iconKey: 'inventory',
        ),
        ServiceItem(
          id: 'iso',
          title: 'ISO certification consulting',
          summary:
              'ISO management-system consulting from gap assessment to audit '
              'readiness.',
          body:
              'Process mapping, documentation, internal-audit coaching, and '
              'certification-body coordination for ISO programmes suited to '
              'your organisation.',
          iconKey: 'iso',
        ),
        ServiceItem(
          id: 'management',
          title: 'Management consulting',
          summary:
              'Business-process consulting for industry and service providers.',
          body:
              'Practical work on how the organisation plans, delivers, and '
              'reviews work — so certification sits on a process that people '
              'can actually run.',
          iconKey: 'hub',
        ),
        ServiceItem(
          id: 'training',
          title: 'Corporate soft-skill training',
          summary:
              'Trainer-led programmes for working teams and students.',
          body:
              'Communication, workplace conduct, and related soft skills — '
              'the same practice Rajendra Pal has delivered since the '
              'coaching and branch-manager years.',
          iconKey: 'school',
        ),
        ServiceItem(
          id: 'web',
          title: 'Website design and development',
          summary:
              'Websites and software solutions for firms that need a clear '
              'public presence.',
          body:
              'IT services from ThinkTrek: sites and software that present '
              'the business cleanly and stay maintainable.',
          iconKey: 'language',
        ),
      ],
      processHeading: 'How BIS licence consulting typically runs',
      processSteps: [
        ProcessStep(
          title: 'Product and scheme check',
          body:
              'We confirm whether ISI mark, CRS, FMCS, or another approval '
              'applies, and which Indian Standard or order to follow.',
        ),
        ProcessStep(
          title: 'Application and testing',
          body:
              'We prepare the portal filing, documents, and samples, then '
              'coordinate testing at a recognised laboratory.',
        ),
        ProcessStep(
          title: 'Inspection and grant',
          body:
              'Where a factory audit is required, we prepare the plant and '
              'follow queries through to licence or registration grant.',
        ),
        ProcessStep(
          title: 'After grant',
          body:
              'Renewals, surveillance, and scope changes so the licence does '
              'not lapse quietly.',
        ),
      ],
      faqs: [
        FaqItem(
          question: 'What is BIS certification?',
          answer:
              'BIS certification shows that a product meets the relevant '
              'Indian Standard. For many goods this is the ISI mark licence; '
              'electronics often follow CRS instead.',
        ),
        FaqItem(
          question: 'Can ThinkTrek help a factory outside India?',
          answer:
              'Yes. Foreign plants typically use FMCS. We advise on the '
              'Indian representative route, documents, and inspection path.',
        ),
        FaqItem(
          question: 'Do you only handle BIS?',
          answer:
              'BIS / ISI is the highlighted service. We also consult on ISO, '
              'EPR, LMPC, management systems, training, and websites.',
        ),
      ],
    ),
    contactPage: const ContactPageContent(
      intro: PageIntro(
        eyebrow: 'CONTACT',
        title: 'Write to Rajendra Pal and the ThinkTrek team.',
        body:
            'Share the product, standard, or training need. We reply from '
            'Navsari by email or phone.',
      ),
      nameLabel: 'Name',
      emailLabel: 'Email',
      messageLabel: 'How can we help?',
      submitLabel: 'Send message',
      successTemplate:
          'Thank you, {name}. ThinkTrek has your note and will follow up.',
    ),
  );

  static final posts = <BlogPost>[
    BlogPost(
      id: '1',
      slug: 'bis-licence-isi-mark-overview',
      title: 'What a BIS licence (ISI mark) involves',
      excerpt:
          'A plain-language outline of ISI mark certification for Indian '
          'manufacturers — standard, testing, inspection, and grant.',
      body:
          'A BIS licence with the ISI mark is the usual route when an Indian '
          'Standard is mandatory for your product.\n\n'
          'The work is sequential: confirm the standard, file the application, '
          'test samples at a recognised lab, host the factory inspection where '
          'required, and keep the licence alive after grant.\n\n'
          'ThinkTrek Solutions supports that path from Navsari, alongside ISO '
          'and related Indian approvals such as CRS, FMCS, EPR, and LMPC.',
      publishedAt: DateTime(2026, 10, 1),
      author: founderName,
    ),
    BlogPost(
      id: '2',
      slug: 'iso-and-management-systems',
      title: 'ISO consulting that a team can actually run',
      excerpt:
          'Certification holds when the process is written for the people who '
          'use it — not only for the auditor.',
      body:
          'ISO consulting at ThinkTrek starts with how work already happens, '
          'then closes gaps in documents, records, and internal audit.\n\n'
          'Rajendra Pal has delivered ISO and management consulting across '
          'industry and service providers since the years before founding '
          'the firm in 2015.\n\n'
          'The aim is a system you can explain on a shop floor, not a shelf '
          'of unread procedures.',
      publishedAt: DateTime(2026, 9, 12),
      author: founderName,
    ),
    BlogPost(
      id: '3',
      slug: 'soft-skills-and-a-working-website',
      title: 'Training and a website sit next to certification',
      excerpt:
          'Soft-skill programmes and a clear site help the certified business '
          'show up well — inside the team and in the market.',
      body:
          'ThinkTrek also delivers corporate soft-skill training and website '
          'design and development.\n\n'
          'Those services grew from earlier work: coaching classes, branch '
          'training, and the IT support clients ask for once the licence or '
          'ISO certificate is in motion.\n\n'
          'One founder, one studio, several practical tools.',
      publishedAt: DateTime(2026, 8, 20),
      author: founderName,
    ),
  ];
}
