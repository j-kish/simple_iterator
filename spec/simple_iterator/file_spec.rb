require 'spec_helper'

describe SimpleIterator::File do
  let(:iterator) do
    SimpleIterator::File.new(
      file_path: file_path,
      separate:  separate,
      increment_lines: increment_lines,
      line_separate_cb: line_separate_cb
    )
  end
  let(:separate) { "\t" }
  let(:increment_lines) { 2 }
  let(:line_separate_cb) do
    lambda { |row|
      {
        id: row[0],
        name: row[1]
      }
    }
  end

  context 'from usage' do
    let(:file_path) { 'spec/simple_iterator/sample.tsv' }

    it 'increment_lines' do
      expect(iterator.next.length).to eq increment_lines
    end

    it 'line_separate_cb' do
      expect(iterator.next[1]).to match({
        id:   '2',
        name: 'name2'
      })
    end

    it 'total' do
      itr = iterator
      count = 0
      while (rows = itr.next)
        count += rows.length
      end
      expect(count).to eq 10
    end
  end
end
