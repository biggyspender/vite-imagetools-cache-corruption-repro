export const images = import.meta.glob(
  [`./images/**/*.{jpg,png,gif,jpeg,svg}`],
  {
    eager: true,
    import: "default",
    query: { url: "" },
  }
) as Record<string, string>;
