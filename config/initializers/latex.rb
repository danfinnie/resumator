LatexToPdf.config.merge!({
  supporting: Dir.glob(Rails.root.join("latex").join('*')),
  command: 'xelatex',
  arguments: ['-etex']
})
