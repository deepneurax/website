'use client'

import { useEffect, useRef, useState } from 'react'
import { motion } from 'framer-motion'
import CountUp from 'react-countup'
import gsap from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

if (typeof window !== 'undefined') {
  gsap.registerPlugin(ScrollTrigger)
}

interface Metric {
  label: string
  value: number
  suffix?: string
  icon?: string
}

// Accent colors per card for visual variety
const cardAccents = [
  { gradient: 'from-blue-500 to-cyan-400', glow: 'rgba(59,130,246,0.35)', ring: 'ring-blue-400/40' },
  { gradient: 'from-violet-500 to-purple-400', glow: 'rgba(139,92,246,0.35)', ring: 'ring-violet-400/40' },
  { gradient: 'from-emerald-500 to-teal-400', glow: 'rgba(16,185,129,0.35)', ring: 'ring-emerald-400/40' },
  { gradient: 'from-amber-500 to-orange-400', glow: 'rgba(245,158,11,0.35)', ring: 'ring-amber-400/40' },
]

export default function MetricsCounter({ metrics }: { metrics: Metric[] }) {
  const [isVisible, setIsVisible] = useState(false)
  const sectionRef = useRef<HTMLDivElement>(null)

  // GSAP stagger animation
  useEffect(() => {
    const ctx = gsap.context(() => {
      if (document.querySelector('.mc-header')) {
        gsap.from('.mc-header', {
          y: 30, opacity: 0, duration: 0.8, ease: 'power3.out',
          scrollTrigger: { trigger: '.mc-header', start: 'top 85%' },
        })
      }
      if (document.querySelector('.mc-card')) {
        gsap.from('.mc-card', {
          y: 40, opacity: 0, scale: 0.95, duration: 0.7, stagger: 0.12, ease: 'power3.out',
          scrollTrigger: { trigger: '.mc-grid', start: 'top 82%' },
        })
      }
    }, sectionRef)
    return () => ctx.revert()
  }, [])

  // Intersection observer for CountUp trigger
  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => { if (entry.isIntersecting) setIsVisible(true) },
      { threshold: 0.25 },
    )
    const el = sectionRef.current
    if (el) observer.observe(el)
    return () => { if (el) observer.unobserve(el) }
  }, [])

  return (
    <section
      ref={sectionRef}
      id="metrics"
      className="relative overflow-hidden py-20 md:py-28"
    >
      {/* ── Background ── */}
      <div className="absolute inset-0 bg-gradient-to-b from-slate-950 via-[#0a1628] to-slate-950" />

      {/* Subtle grid overlay */}
      <div
        className="pointer-events-none absolute inset-0 opacity-[0.04]"
        style={{
          backgroundImage:
            'linear-gradient(rgba(255,255,255,0.08) 1px, transparent 1px), linear-gradient(90deg, rgba(255,255,255,0.08) 1px, transparent 1px)',
          backgroundSize: '60px 60px',
        }}
      />

      {/* Glow orbs */}
      <motion.div
        className="pointer-events-none absolute -top-32 left-1/4 h-[420px] w-[420px] rounded-full bg-blue-600/10 blur-[100px]"
        animate={{ y: [0, 30, 0], scale: [1, 1.08, 1] }}
        transition={{ duration: 18, repeat: Infinity, ease: 'easeInOut' }}
      />
      <motion.div
        className="pointer-events-none absolute -bottom-32 right-1/4 h-[350px] w-[350px] rounded-full bg-violet-600/10 blur-[100px]"
        animate={{ y: [0, -25, 0], scale: [1, 1.06, 1] }}
        transition={{ duration: 22, repeat: Infinity, ease: 'easeInOut', delay: 3 }}
      />

      {/* ── Content ── */}
      <div className="relative z-10 mx-auto max-w-6xl px-6">
        {/* Header */}
        <div className="mc-header mb-14 text-center">
          <p className="mb-3 text-xs font-bold uppercase tracking-[0.3em] text-blue-400">
            Our Track Record
          </p>
          <h2 className="text-3xl font-extrabold tracking-tight text-white sm:text-4xl md:text-5xl">
            Impact in Numbers
          </h2>
          <p className="mx-auto mt-4 max-w-md text-sm text-slate-400 md:text-base">
            Measurable results that speak for themselves
          </p>
        </div>

        {/* Cards */}
        <div className="mc-grid grid grid-cols-2 gap-5 sm:gap-6 lg:grid-cols-4 lg:gap-8">
          {metrics.slice(0, 4).map((metric, i) => {
            const accent = cardAccents[i % cardAccents.length]
            return (
              <motion.div
                key={metric.label}
                whileHover={{ y: -6, scale: 1.03 }}
                transition={{ type: 'spring', stiffness: 300, damping: 20 }}
                className="mc-card group relative"
              >
                {/* Card body */}
                <div className="relative overflow-hidden rounded-2xl border border-white/10 bg-white/[0.04] p-6 backdrop-blur-sm transition-colors duration-300 group-hover:border-white/20 group-hover:bg-white/[0.07] sm:p-8">
                  {/* Top accent bar */}
                  <div
                    className={`absolute left-0 top-0 h-[3px] w-full bg-gradient-to-r ${accent.gradient} opacity-60 transition-opacity group-hover:opacity-100`}
                  />

                  {/* Hover glow */}
                  <div
                    className="pointer-events-none absolute -right-8 -top-8 h-24 w-24 rounded-full blur-2xl opacity-0 transition-opacity duration-500 group-hover:opacity-100"
                    style={{ background: accent.glow }}
                  />

                  {/* Icon */}
                  <div className="mb-5 text-3xl sm:text-4xl leading-none">
                    {metric.icon || '📊'}
                  </div>

                  {/* Number */}
                  <div className="mb-2 text-4xl font-black tracking-tight text-white sm:text-5xl">
                    {isVisible ? (
                      <>
                        <CountUp
                          end={metric.value}
                          duration={2.5}
                          separator=","
                        />
                        <span className={`bg-gradient-to-r ${accent.gradient} bg-clip-text text-transparent`}>
                          {metric.suffix}
                        </span>
                      </>
                    ) : (
                      <span className="opacity-0">0</span>
                    )}
                  </div>

                  {/* Label */}
                  <p className="text-xs font-semibold uppercase tracking-widest text-slate-400 transition-colors group-hover:text-slate-300 sm:text-sm">
                    {metric.label}
                  </p>
                </div>
              </motion.div>
            )
          })}
        </div>
      </div>
    </section>
  )
}
