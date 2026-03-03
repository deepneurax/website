'use client'

import { useMemo } from 'react'
import SphereDataGrid, { type SphereNodeData } from '@/components/ui/SphereDataGrid'

// ==========================================
// TYPES
// ==========================================

interface SphereShowcaseItem {
  id: string
  title: string
  description: string
  image: string
  link: string
  order: number
}

interface SphereShowcaseData {
  sectionTitle?: string
  sectionDescription?: string
  introHeading?: string
  introSubheading?: string
  contentHeading?: string
  contentDescription?: string
  items?: SphereShowcaseItem[]
}

interface BubbleSphereShowcaseProps {
  data: SphereShowcaseData
}

// Fallback images if the admin hasn't added enough
const FALLBACK_IMAGES = [
  'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=300&q=80',
  'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=300&q=80',
  'https://images.unsplash.com/photo-1555255707-c07966088b7b?w=300&q=80',
  'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=300&q=80',
  'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=300&q=80',
  'https://images.unsplash.com/photo-1558494949-ef010cbdcc31?w=300&q=80',
  'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=300&q=80',
  'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?w=300&q=80',
  'https://images.unsplash.com/photo-1580894894513-541e068a3e2b?w=300&q=80',
  'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=300&q=80',
  'https://images.unsplash.com/photo-1531746790095-e5577e0e3ede?w=300&q=80',
  'https://images.unsplash.com/photo-1488229297570-58520851e868?w=300&q=80',
]

// ==========================================
// COMPONENT
// ==========================================

export default function BubbleSphereShowcase({ data }: BubbleSphereShowcaseProps) {
  const heading = data.contentHeading || data.sectionTitle || 'Explore Our Vision'
  const description =
    data.contentDescription ||
    data.sectionDescription ||
    'Discover a world where technology meets creativity.'

  // Map admin showcase items → SphereNodeData for the 3D sphere
  const sphereNodes: SphereNodeData[] = useMemo(() => {
    const adminItems = (data.items || [])
      .filter((item) => item.image && item.image.length > 0)
      .sort((a, b) => a.order - b.order)

    // Use admin images, pad with fallbacks to ensure a full-looking sphere
    const images: { src: string; title: string; description: string; link: string }[] =
      adminItems.map((item) => ({
        src: item.image,
        title: item.title,
        description: item.description,
        link: item.link,
      }))

    // Pad to at least 12 nodes for visual density
    const minNodes = 12
    if (images.length < minNodes) {
      const needed = minNodes - images.length
      for (let i = 0; i < needed; i++) {
        images.push({
          src: FALLBACK_IMAGES[i % FALLBACK_IMAGES.length],
          title: '',
          description: '',
          link: '#',
        })
      }
    }

    return images.map((img, i) => ({
      id: `bubble-${i}`,
      src: img.src,
      alt: img.title || `Showcase ${i + 1}`,
      title: img.title || undefined,
      description: img.description || undefined,
    }))
  }, [data.items])

  return (
    <section className="relative w-full overflow-hidden bg-gradient-to-b from-slate-950 via-slate-900 to-slate-950 py-20 md:py-28">
      {/* Background animated glow */}
      <div className="pointer-events-none absolute inset-0 overflow-hidden">
        <div className="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-[800px] h-[800px] rounded-full bg-blue-500/5 blur-3xl animate-pulse" />
        <div className="absolute left-1/4 top-1/3 w-[400px] h-[400px] rounded-full bg-purple-500/5 blur-3xl" style={{ animation: 'bss-float1 8s ease-in-out infinite' }} />
        <div className="absolute right-1/4 bottom-1/3 w-[500px] h-[500px] rounded-full bg-cyan-500/5 blur-3xl" style={{ animation: 'bss-float2 10s ease-in-out infinite' }} />
      </div>

      {/* Section heading */}
      <div className="relative z-10 mx-auto max-w-3xl px-6 text-center mb-12 md:mb-16">
        {data.introSubheading && (
          <p className="mb-3 text-xs font-bold uppercase tracking-[0.25em] text-blue-400">
            {data.introSubheading}
          </p>
        )}
        <h2 className="text-3xl font-bold tracking-tight text-white sm:text-4xl md:text-5xl">
          {heading}
        </h2>
        <p className="mt-4 text-base text-slate-400 md:text-lg leading-relaxed max-w-xl mx-auto">
          {description}
        </p>
      </div>

      {/* 3D Bubble Sphere */}
      <div className="relative z-10 flex items-center justify-center px-4">
        {/* Desktop */}
        <div className="hidden md:block">
          <SphereDataGrid
            nodes={sphereNodes}
            containerSize={560}
            sphereRadius={240}
            baseNodeScale={0.16}
            hoverScale={1.3}
            perspective={1200}
            autoRotate
            autoRotateSpeed={0.15}
            dragSensitivity={0.4}
            momentumDecay={0.96}
            className="mx-auto"
          />
        </div>
        {/* Mobile */}
        <div className="md:hidden">
          <SphereDataGrid
            nodes={sphereNodes}
            containerSize={340}
            sphereRadius={145}
            baseNodeScale={0.18}
            hoverScale={1.25}
            perspective={900}
            autoRotate
            autoRotateSpeed={0.2}
            dragSensitivity={0.5}
            momentumDecay={0.95}
            className="mx-auto"
          />
        </div>
      </div>

      {/* Interaction hint */}
      <p className="relative z-10 mt-8 text-center text-xs text-slate-500 tracking-wide">
        Drag to rotate &bull; Click any image to explore
      </p>

      {/* Keyframes for background glow animation */}
      <style>{`
        @keyframes bss-float1 {
          0%, 100% { transform: translateY(0) scale(1); }
          50% { transform: translateY(-30px) scale(1.05); }
        }
        @keyframes bss-float2 {
          0%, 100% { transform: translateY(0) scale(1); }
          50% { transform: translateY(20px) scale(1.08); }
        }
      `}</style>
    </section>
  )
}
