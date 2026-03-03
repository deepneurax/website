-- DeepNeurax Website - Supabase Database Schema
-- Run this SQL in your Supabase SQL Editor to create all required tables

-- ============================================
-- HERO SECTION
-- ============================================
CREATE TABLE IF NOT EXISTS hero (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL DEFAULT 'Transforming Business with AI',
  subtitle TEXT DEFAULT 'Building the Future of Intelligent Solutions',
  description TEXT DEFAULT 'We deliver cutting-edge AI solutions that drive innovation, efficiency, and growth for businesses worldwide.',
  cta_text TEXT DEFAULT 'Get Started',
  cta_link TEXT DEFAULT '/contact',
  secondary_cta_text TEXT DEFAULT 'Learn More',
  secondary_cta_link TEXT DEFAULT '/services',
  background_image_url TEXT,
  taglines JSONB DEFAULT '[
    {"tagline": "AI Innovation", "description": "Pioneering the future of artificial intelligence"},
    {"tagline": "Smart Solutions", "description": "Intelligent systems tailored for your needs"},
    {"tagline": "Digital Transformation", "description": "Revolutionizing how businesses operate"}
  ]'::jsonb,
  background_videos JSONB DEFAULT '[]'::jsonb,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- SERVICES
-- ============================================
CREATE TABLE IF NOT EXISTS services (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  description TEXT,
  icon TEXT DEFAULT '🚀',
  image_url TEXT,
  link TEXT,
  "order" INTEGER DEFAULT 0,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- PRODUCTS
-- ============================================
CREATE TABLE IF NOT EXISTS products (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  description TEXT,
  icon TEXT DEFAULT '📦',
  image_url TEXT,
  link TEXT,
  "order" INTEGER DEFAULT 0,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- METRICS
-- ============================================
CREATE TABLE IF NOT EXISTS metrics (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  label TEXT NOT NULL,
  value INTEGER NOT NULL,
  suffix TEXT DEFAULT '+',
  icon TEXT DEFAULT '📊',
  "order" INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- ABOUT US
-- ============================================
CREATE TABLE IF NOT EXISTS about_us (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  who_we_are_heading TEXT DEFAULT 'Who We Are',
  who_we_are_description TEXT,
  core_values_heading TEXT DEFAULT 'Our Core Values',
  image_url TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- CORE VALUES
-- ============================================
CREATE TABLE IF NOT EXISTS core_values (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  icon TEXT DEFAULT '💡',
  image_url TEXT,
  "order" INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- SPHERE SHOWCASE
-- ============================================
CREATE TABLE IF NOT EXISTS sphere_showcase (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  section_title TEXT DEFAULT 'Explore Our Capabilities',
  section_description TEXT DEFAULT 'We deliver exceptional results through innovation, expertise, and dedication',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS sphere_showcase_items (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  image_url TEXT,
  link TEXT DEFAULT '#',
  "order" INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- FEATURES SECTION
-- ============================================
CREATE TABLE IF NOT EXISTS features_section (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  intro_heading TEXT DEFAULT 'Our Technology',
  intro_subheading TEXT DEFAULT 'Built for the Future',
  section_title TEXT DEFAULT 'Cutting-Edge AI Features',
  section_description TEXT DEFAULT 'Experience the power of next-generation artificial intelligence',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS features_section_images (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  image_url TEXT NOT NULL,
  alt_text TEXT,
  "order" INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- CASE STUDIES SECTION
-- ============================================
CREATE TABLE IF NOT EXISTS case_studies_section (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT DEFAULT 'Success Stories',
  description TEXT DEFAULT 'See how we have helped businesses transform with AI',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- CASE STUDIES
-- ============================================
CREATE TABLE IF NOT EXISTS case_studies (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  description TEXT,
  bullet_points JSONB DEFAULT '[]'::jsonb,
  metrics JSONB DEFAULT '[]'::jsonb,
  background_image_url TEXT,
  is_active BOOLEAN DEFAULT true,
  "order" INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- TESTIMONIALS
-- ============================================
CREATE TABLE IF NOT EXISTS testimonials (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  author TEXT NOT NULL,
  handle TEXT,
  role TEXT,
  text TEXT NOT NULL,
  avatar_url TEXT,
  "order" INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- BLOG POSTS
-- ============================================
CREATE TABLE IF NOT EXISTS blog_posts (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  excerpt TEXT,
  content TEXT,
  cover_image_url TEXT,
  author TEXT,
  tags JSONB DEFAULT '[]'::jsonb,
  og_image_url TEXT,
  meta_title TEXT,
  meta_description TEXT,
  canonical_url TEXT,
  published_at TIMESTAMPTZ DEFAULT NOW(),
  is_published BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- CTA (Call to Action)
-- ============================================
CREATE TABLE IF NOT EXISTS cta (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT DEFAULT 'Ready to Transform Your Business?',
  description TEXT DEFAULT 'Let''s discuss how AI can help you achieve your goals.',
  button_text TEXT DEFAULT 'Get Started Today',
  button_link TEXT DEFAULT '/contact',
  secondary_button_text TEXT DEFAULT 'View Our Work',
  secondary_button_link TEXT DEFAULT '/#case-studies',
  background_image_url TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- FOOTER
-- ============================================
CREATE TABLE IF NOT EXISTS footer (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  site_name TEXT DEFAULT 'DeepNeurax',
  tagline TEXT DEFAULT 'AI-Powered Solutions for the Future',
  company_description TEXT DEFAULT 'DeepNeurax is a pioneering AI company dedicated to transforming businesses through innovative artificial intelligence solutions.',
  site_logo_url TEXT,
  site_logo_light_url TEXT,
  copyright_text TEXT DEFAULT '© 2025 DeepNeurax. All rights reserved.',
  contact_email TEXT DEFAULT 'contact@deepneurax.com',
  contact_phone TEXT DEFAULT '+1 (555) 123-4567',
  address TEXT DEFAULT '123 AI Blvd, San Francisco, CA',
  social_links JSONB DEFAULT '[
    {"platform": "twitter", "url": "https://twitter.com/deepneurax"},
    {"platform": "linkedin", "url": "https://linkedin.com/company/deepneurax"},
    {"platform": "github", "url": "https://github.com/deepneurax"}
  ]'::jsonb,
  menu_items JSONB DEFAULT '[
    {"label": "Home", "href": "/"},
    {"label": "Services", "href": "/services"},
    {"label": "Products", "href": "/products"},
    {"label": "Blog", "href": "/blog"},
    {"label": "Contact", "href": "/contact"}
  ]'::jsonb,
  cta JSONB DEFAULT '{"label": "Get Started", "href": "/contact"}'::jsonb,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- SITE SETTINGS
-- ============================================
CREATE TABLE IF NOT EXISTS site_settings (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  site_name TEXT DEFAULT 'DeepNeurax',
  site_description TEXT DEFAULT 'AI-Powered Solutions for the Future',
  site_logo_url TEXT,
  site_logo_light_url TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- ENABLE ROW LEVEL SECURITY (RLS)
-- ============================================
ALTER TABLE hero ENABLE ROW LEVEL SECURITY;
ALTER TABLE services ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE metrics ENABLE ROW LEVEL SECURITY;
ALTER TABLE about_us ENABLE ROW LEVEL SECURITY;
ALTER TABLE core_values ENABLE ROW LEVEL SECURITY;
ALTER TABLE sphere_showcase ENABLE ROW LEVEL SECURITY;
ALTER TABLE sphere_showcase_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE features_section ENABLE ROW LEVEL SECURITY;
ALTER TABLE features_section_images ENABLE ROW LEVEL SECURITY;
ALTER TABLE case_studies_section ENABLE ROW LEVEL SECURITY;
ALTER TABLE case_studies ENABLE ROW LEVEL SECURITY;
ALTER TABLE testimonials ENABLE ROW LEVEL SECURITY;
ALTER TABLE blog_posts ENABLE ROW LEVEL SECURITY;
ALTER TABLE cta ENABLE ROW LEVEL SECURITY;
ALTER TABLE footer ENABLE ROW LEVEL SECURITY;
ALTER TABLE site_settings ENABLE ROW LEVEL SECURITY;

-- ============================================
-- CREATE POLICIES FOR PUBLIC READ ACCESS (idempotent)
-- ============================================
DO $$ 
DECLARE
  t TEXT;
BEGIN
  FOREACH t IN ARRAY ARRAY[
    'hero','services','products','metrics','about_us','core_values',
    'sphere_showcase','sphere_showcase_items','features_section',
    'features_section_images','case_studies_section','case_studies',
    'testimonials','blog_posts','cta','footer','site_settings'
  ]
  LOOP
    IF NOT EXISTS (
      SELECT 1 FROM pg_policies WHERE policyname = 'Allow public read access on ' || t AND tablename = t
    ) THEN
      EXECUTE format('CREATE POLICY "Allow public read access on %s" ON %I FOR SELECT USING (true)', t, t);
    END IF;
  END LOOP;
END $$;

-- ============================================
-- INSERT DEFAULT DATA
-- ============================================

-- Hero (with background image and sample video)
INSERT INTO hero (title, subtitle, description, background_image_url, background_videos) VALUES (
  'Transforming Business with AI',
  'Building the Future of Intelligent Solutions',
  'We deliver cutting-edge AI solutions that drive innovation, efficiency, and growth for businesses worldwide.',
  'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=1920&q=80',
  '[{"videoUrl": "https://cdn.pixabay.com/video/2020/08/09/46904-449623255_large.mp4", "thumbnail": "https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=400&q=80", "duration": 15}]'::jsonb
) ON CONFLICT DO NOTHING;

-- Services (with images)
INSERT INTO services (title, slug, description, icon, image_url, link, "order") VALUES
  ('Machine Learning Solutions', 'machine-learning', 'Custom ML models designed to solve your most complex business challenges. From predictive analytics to recommendation systems, we build intelligent solutions that learn and improve.', '🤖', 'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=800&q=80', '/services/machine-learning', 1),
  ('Data Analytics & Insights', 'data-analytics', 'Transform raw data into actionable insights. Our analytics solutions help you make data-driven decisions with advanced visualization and reporting tools.', '📊', 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=800&q=80', '/services/data-analytics', 2),
  ('Cloud AI Infrastructure', 'cloud-infrastructure', 'Scalable cloud solutions for AI workloads. We design and deploy infrastructure that grows with your needs while maintaining optimal performance.', '☁️', 'https://images.unsplash.com/photo-1544197150-b99a580bb7a8?w=800&q=80', '/services/cloud-infrastructure', 3),
  ('AI Security & Compliance', 'ai-security', 'Protect your AI systems with enterprise-grade security. We ensure your models and data meet the highest standards of compliance and protection.', '🛡️', 'https://images.unsplash.com/photo-1563986768609-322da13575f2?w=800&q=80', '/services/ai-security', 4),
  ('AI Consulting', 'ai-consulting', 'Strategic guidance for your AI journey. Our experts help you identify opportunities, plan implementations, and maximize ROI from AI investments.', '⚡', 'https://images.unsplash.com/photo-1552664730-d307ca884978?w=800&q=80', '/services/ai-consulting', 5),
  ('Natural Language Processing', 'nlp-solutions', 'Advanced NLP solutions for text analysis, chatbots, sentiment analysis, and language understanding. Make sense of unstructured text data at scale.', '💬', 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=800&q=80', '/services/nlp-solutions', 6)
ON CONFLICT (slug) DO NOTHING;

-- Products (with images)
INSERT INTO products (name, slug, description, icon, image_url, link, "order") VALUES
  ('NeuraxPlatform', 'neurax-platform', 'An enterprise-grade AI platform that enables rapid development and deployment of machine learning models with intuitive interfaces and powerful automation.', '📦', 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=800&q=80', '/products/neurax-platform', 1),
  ('AutoML Suite', 'automl-suite', 'Automated machine learning toolkit that handles feature engineering, model selection, and hyperparameter tuning, making AI accessible to every team.', '⚙️', 'https://images.unsplash.com/photo-1555949963-aa79dcee981c?w=800&q=80', '/products/automl-suite', 2),
  ('DataViz Pro', 'dataviz-pro', 'Advanced data visualization and analytics dashboard that transforms complex datasets into intuitive, interactive visualizations for better decision making.', '📊', 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=800&q=80', '/products/dataviz-pro', 3),
  ('AI Agent Framework', 'ai-agent-framework', 'Build intelligent conversational agents and autonomous AI systems with our comprehensive framework supporting multiple LLM providers.', '🤖', 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=800&q=80', '/products/ai-agent-framework', 4)
ON CONFLICT (slug) DO NOTHING;

-- Metrics
INSERT INTO metrics (label, value, suffix, icon, "order") VALUES
  ('Projects Delivered', 500, '+', '🚀', 1),
  ('Happy Clients', 200, '+', '😊', 2),
  ('AI Models Deployed', 1000, '+', '🤖', 3),
  ('Data Points Processed', 10, 'B+', '📊', 4)
ON CONFLICT DO NOTHING;

-- About Us (with team image)
INSERT INTO about_us (who_we_are_heading, who_we_are_description, core_values_heading, image_url) VALUES (
  'Who We Are',
  'DeepNeurax is a pioneering AI company dedicated to transforming businesses through innovative artificial intelligence solutions. With a team of world-class engineers and data scientists, we deliver cutting-edge technology that drives real results.',
  'Our Core Values',
  'https://images.unsplash.com/photo-1522071820081-009f0129c71c?w=800&q=80'
) ON CONFLICT DO NOTHING;

-- Core Values (with images)
INSERT INTO core_values (title, description, icon, image_url, "order") VALUES
  ('Innovation', 'Pushing the boundaries of what AI can achieve', '💡', 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=400&q=80', 1),
  ('Excellence', 'Delivering exceptional quality in everything we do', '⭐', 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=400&q=80', 2),
  ('Integrity', 'Building trust through transparent and ethical AI', '🤝', 'https://images.unsplash.com/photo-1521737852567-6949f3f9f2b5?w=400&q=80', 3),
  ('Impact', 'Creating meaningful change for our clients and society', '🎯', 'https://images.unsplash.com/photo-1553877522-43269d4ea984?w=400&q=80', 4)
ON CONFLICT DO NOTHING;

-- Sphere Showcase
INSERT INTO sphere_showcase (section_title, section_description) VALUES (
  'Explore Our Capabilities',
  'We deliver exceptional results through innovation, expertise, and dedication'
) ON CONFLICT DO NOTHING;

-- Sphere Showcase Items (with images — 12 items for visual density)
INSERT INTO sphere_showcase_items (title, description, image_url, link, "order") VALUES
  ('Deep Learning', 'Neural networks that understand complex patterns', 'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=400&q=80', '#deep-learning', 1),
  ('Computer Vision', 'AI that sees and understands the visual world', 'https://images.unsplash.com/photo-1535378917042-10a22c95931a?w=400&q=80', '#computer-vision', 2),
  ('NLP', 'Natural language understanding at scale', 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=400&q=80', '#nlp', 3),
  ('Predictive Analytics', 'Forecasting the future with data', 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=400&q=80', '#analytics', 4),
  ('Robotics & Automation', 'Intelligent automation for modern industry', 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=400&q=80', '#robotics', 5),
  ('Cloud AI', 'Scalable AI infrastructure in the cloud', 'https://images.unsplash.com/photo-1544197150-b99a580bb7a8?w=400&q=80', '#cloud-ai', 6),
  ('Edge Computing', 'AI processing at the edge for real-time decisions', 'https://images.unsplash.com/photo-1558494949-ef010cbdcc31?w=400&q=80', '#edge', 7),
  ('Data Engineering', 'Building robust data pipelines at scale', 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400&q=80', '#data-eng', 8),
  ('Generative AI', 'Creating content and solutions with generative models', 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=400&q=80', '#gen-ai', 9),
  ('IoT Intelligence', 'Smart connected devices and sensor networks', 'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?w=400&q=80', '#iot', 10),
  ('Cybersecurity AI', 'AI-powered threat detection and prevention', 'https://images.unsplash.com/photo-1563986768609-322da13575f2?w=400&q=80', '#security', 11),
  ('Digital Twins', 'Virtual replicas for simulation and optimization', 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=400&q=80', '#digital-twins', 12)
ON CONFLICT DO NOTHING;

-- Features Section
INSERT INTO features_section (intro_heading, intro_subheading, section_title, section_description) VALUES (
  'Our Technology',
  'Built for the Future',
  'Cutting-Edge AI Features',
  'Experience the power of next-generation artificial intelligence'
) ON CONFLICT DO NOTHING;

-- Features Section Images (placeholder tech images)
INSERT INTO features_section_images (image_url, alt_text, "order") VALUES
  ('https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=600&q=80', 'AI neural network visualization', 1),
  ('https://images.unsplash.com/photo-1558494949-ef010cbdcc31?w=600&q=80', 'Data center infrastructure', 2),
  ('https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=600&q=80', 'Global technology network', 3),
  ('https://images.unsplash.com/photo-1535378917042-10a22c95931a?w=600&q=80', 'Computer vision technology', 4)
ON CONFLICT DO NOTHING;

-- Case Studies Section
INSERT INTO case_studies_section (title, description) VALUES (
  'Success Stories',
  'See how we have helped businesses transform with AI'
) ON CONFLICT DO NOTHING;

-- Case Studies (with background images)
INSERT INTO case_studies (title, slug, description, bullet_points, metrics, background_image_url, "order") VALUES
  ('Healthcare AI Transformation', 'healthcare-ai-transformation', 'Implemented an AI-powered diagnostic system that improved patient outcomes by 40% and reduced diagnosis time by 60%.',
   '["Reduced diagnosis time by 60%", "Improved accuracy to 95%", "Processed 1M+ patient records", "Integrated with existing systems"]'::jsonb,
   '[{"label": "Accuracy Improvement", "value": "95%"}, {"label": "Time Saved", "value": "60%"}, {"label": "Records Processed", "value": "1M+"}]'::jsonb,
   'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=800&q=80', 1),
  ('Financial Fraud Detection', 'financial-fraud-detection', 'Developed a real-time fraud detection system for a major bank that prevented $50M in fraudulent transactions annually.',
   '["Real-time transaction analysis", "$50M+ fraud prevented annually", "99.9% uptime achieved", "Reduced false positives by 70%"]'::jsonb,
   '[{"label": "Fraud Prevented", "value": "$50M+"}, {"label": "Uptime", "value": "99.9%"}, {"label": "False Positive Reduction", "value": "70%"}]'::jsonb,
   'https://images.unsplash.com/photo-1563986768609-322da13575f2?w=800&q=80', 2),
  ('E-commerce Personalization', 'ecommerce-personalization', 'Built a recommendation engine that increased customer engagement by 150% and boosted sales by 35%.',
   '["Personalized recommendations for 10M+ users", "35% increase in sales", "150% boost in engagement", "Seamless API integration"]'::jsonb,
   '[{"label": "Sales Increase", "value": "35%"}, {"label": "Engagement Boost", "value": "150%"}, {"label": "Users Served", "value": "10M+"}]'::jsonb,
   'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=800&q=80', 3)
ON CONFLICT (slug) DO NOTHING;

-- Testimonials (with avatar images)
INSERT INTO testimonials (author, handle, role, text, avatar_url, "order") VALUES
  ('Sarah Johnson', '@sarahj_cto', 'CTO, TechCorp', 'DeepNeurax transformed our data infrastructure. Their AI solutions have been game-changing for our business operations.', 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150&q=80', 1),
  ('Michael Chen', '@mchen_ai', 'VP Engineering, DataFlow', 'The team at DeepNeurax delivered exceptional results. Our ML pipeline is now 10x faster and more reliable.', 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&q=80', 2),
  ('Emily Rodriguez', '@emilyrod', 'Director of AI, InnovateCo', 'Working with DeepNeurax was a pleasure. They understood our needs and delivered beyond expectations.', 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&q=80', 3),
  ('David Park', '@dpark_tech', 'CEO, StartupX', 'The AI consulting services helped us identify opportunities we never knew existed. Highly recommended!', 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&q=80', 4),
  ('Lisa Wang', '@lisawang_ml', 'Head of Data Science, FinServ', 'DeepNeurax''s fraud detection system saved us millions. Their expertise in financial AI is unmatched.', 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=150&q=80', 5)
ON CONFLICT DO NOTHING;

-- Blog Posts (with cover images and SEO metadata)
INSERT INTO blog_posts (title, slug, excerpt, content, author, tags, cover_image_url, og_image_url, meta_title, meta_description, published_at) VALUES
  ('The Future of AI in Enterprise', 'future-of-ai-enterprise', 'Exploring how artificial intelligence is reshaping enterprise operations and what to expect in the coming years.',
   '## The Future of AI in Enterprise\n\nArtificial intelligence is no longer a futuristic concept—it''s here, and it''s transforming how businesses operate.\n\n### Key Trends\n\n1. **Automated Decision Making** - AI systems are increasingly being used to make complex business decisions in real-time.\n\n2. **Predictive Analytics** - Companies are leveraging AI to forecast market trends, customer behavior, and operational needs.\n\n3. **Natural Language Processing** - Chatbots and virtual assistants are becoming more sophisticated.',
   'Dr. James Wilson', '["AI", "Enterprise", "Technology"]'::jsonb,
   'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=800&q=80',
   'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=1200&q=80',
   'The Future of AI in Enterprise | DeepNeurax',
   'Exploring how artificial intelligence is reshaping enterprise operations.',
   '2025-12-15T10:00:00.000Z'),
  ('Machine Learning Best Practices', 'ml-best-practices', 'A comprehensive guide to implementing machine learning solutions that deliver real business value.',
   '## Machine Learning Best Practices\n\nImplementing machine learning successfully requires more than just algorithms—it requires a strategic approach.\n\n### Essential Practices\n\n1. **Start with Clean Data** - The quality of your ML model is only as good as the data you train it on.\n\n2. **Choose the Right Model** - Not every problem needs deep learning. Sometimes simpler models work better.\n\n3. **Monitor and Iterate** - ML models need continuous monitoring and retraining to maintain accuracy.',
   'Sarah Chen', '["Machine Learning", "Best Practices", "Data Science"]'::jsonb,
   'https://images.unsplash.com/photo-1555255707-c07966088b7b?w=800&q=80',
   'https://images.unsplash.com/photo-1555255707-c07966088b7b?w=1200&q=80',
   'Machine Learning Best Practices | DeepNeurax',
   'A comprehensive guide to implementing machine learning solutions that deliver real business value.',
   '2025-11-28T10:00:00.000Z'),
  ('Building Ethical AI Systems', 'ethical-ai-systems', 'Why ethical considerations should be at the forefront of AI development and how to implement them.',
   '## Building Ethical AI Systems\n\nAs AI becomes more prevalent, ensuring these systems are fair, transparent, and accountable is crucial.\n\n### Principles of Ethical AI\n\n1. **Fairness** - AI systems should not discriminate against any group.\n\n2. **Transparency** - Users should understand how AI decisions are made.\n\n3. **Accountability** - There should be clear ownership of AI outcomes.',
   'Maria Rodriguez', '["Ethics", "AI", "Responsible AI"]'::jsonb,
   'https://images.unsplash.com/photo-1531746790095-e5577e0e3ede?w=800&q=80',
   'https://images.unsplash.com/photo-1531746790095-e5577e0e3ede?w=1200&q=80',
   'Building Ethical AI Systems | DeepNeurax',
   'Why ethical considerations should be at the forefront of AI development.',
   '2025-11-10T10:00:00.000Z')
ON CONFLICT (slug) DO NOTHING;

-- CTA (with background image)
INSERT INTO cta (title, description, button_text, button_link, background_image_url) VALUES (
  'Ready to Transform Your Business?',
  'Let''s discuss how AI can help you achieve your goals. Schedule a free consultation with our experts.',
  'Get Started Today',
  '/contact',
  'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=1920&q=80'
) ON CONFLICT DO NOTHING;

-- Footer
INSERT INTO footer (site_name, tagline, copyright_text) VALUES (
  'DeepNeurax',
  'AI-Powered Solutions for the Future',
  '© 2025 DeepNeurax. All rights reserved.'
) ON CONFLICT DO NOTHING;

-- Site Settings
INSERT INTO site_settings (site_name, site_description) VALUES (
  'DeepNeurax',
  'AI-Powered Solutions for the Future'
) ON CONFLICT DO NOTHING;

-- ============================================
-- CREATE STORAGE BUCKET FOR IMAGES
-- ============================================
-- Run this in the Supabase Dashboard > Storage section
-- Create a bucket called 'images' and make it public
