require 'spec_helper'

describe SimpleIterator::Plain do
  let(:iterator) do
    SimpleIterator::Plain.new(
      offset: offset,
      increment_offset: increment_offset,
      next_cb: next_cb
    )
  end
  let(:offset) { 0 }
  let(:increment_offset) { 2 }
  let(:next_cb) do
    lambda { |current_offset|
      return nil if current_offset >= data.length

      limit = current_offset + increment_offset - 1
      limit = data.length if limit > data.length
      data[current_offset .. limit]
    }
  end

  let(:data) do
    [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
  end

  context 'from usage' do
    it 'increment_offset' do
      expect(iterator.next.length).to eq increment_offset
    end

    it 'next_cb' do
      itr = iterator
      expect(itr.next[0]).to match(1)
      expect(itr.next[1]).to match(4)
      expect(itr.next[1]).to match(6)
      expect(itr.next[1]).to match(8)
      expect(itr.next[1]).to match(10)
    end

    it 'total' do
      itr = iterator
      count = 0
      while (rows = itr.next)
        count += rows.length
      end
      expect(count).to eq data.length
    end
  end
end
