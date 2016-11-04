require 'test_helper'

class GitTest < Minitest::Test
  def test_get_tags_sort_by_date_asc
    output = <<-EOF
refs/tags/0.0.1 Thu Aug 4 12:34:56 2011 +0200
refs/tags/1.0.0 Fri Aug 5 11:11:11 2011 +0200
refs/tags/1.0.1 Thu Sep 12 21:10:00 2013 +0200
refs/tags/1.1.0 Thu Dec 10 10:10:10 2015 +0200
refs/tags/2.0.0 Fri Dec 11 12:12:12 2015 +0200
    EOF
    expected = [
      '0.0.1 Thu Aug 4 12:34:56 2011 +0200',
      '1.0.0 Fri Aug 5 11:11:11 2011 +0200',
      '1.0.1 Thu Sep 12 21:10:00 2013 +0200',
      '1.1.0 Thu Dec 10 10:10:10 2015 +0200',
      '2.0.0 Fri Dec 11 12:12:12 2015 +0200'
    ]
    MindTheChanges::Git.expects(:`).with("git for-each-ref --sort=taggerdate --format '%(refname) %(taggerdate)' refs/tags").returns(output).once
    assert_equal(expected, MindTheChanges::Git.get_tags_sort_by_date_asc)
  end
  
  def test_get_commit_hash
    tag = '1.1.0'
    output = "1a2b3c0f0f0f0f0f0f0f0f0f0f0f0f0f0f1a2b3c\n"
    expected = output.strip
    MindTheChanges::Git.expects(:`).with("git rev-list -n 1 #{tag}").returns(output).once
    assert_equal(expected, MindTheChanges::Git.get_commit_hash(tag))
  end
  
  def test_get_commit_hash_of_head
    output = "1a2b3c0f0f0f0f0f0f0f0f0f0f0f0f0f0f1a2b3c\n"
    expected = output.strip
    MindTheChanges::Git.expects(:`).with("git rev-parse HEAD").returns(output).once
    assert_equal(expected, MindTheChanges::Git.get_commit_hash_of_head)
  end
end
