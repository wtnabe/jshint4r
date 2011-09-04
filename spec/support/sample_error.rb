def sample_error
  [ 'jshint.js',
    [
      {
        'id'        => '(error)',
        'raw'       => 'Missing semicolon.',
        'evidence'  => '    itself.edition = \'2011-04-16\'',
        'line'      => 4019,
        'character' => 32,
        'reason'    => 'Missing semicolon.'
      },
      {
        'id'        => '(error)',
        'raw'       => 'Missing semicolon.',
        'evidence'  => '    exports.JSHINT = JSHINT',
        'line'      => 4026,
        'character' => 28,
        'reason'    => 'Missing semicolon.'
      }
    ]
  ]
end
