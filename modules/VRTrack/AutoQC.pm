package VRTrack::AutoQC;

=head1 NAME

VRTrack::AutoQC - Sequence Tracking Lane Quality Score object

=head1 SYNOPSIS

=head1 DESCRIPTION

An object describing the tracked properties of a qc score for a lane.

=head1 AUTHOR

mp15@sanger.ac.uk (author)

=head1 METHODS

=cut

use strict;
use warnings;
use Carp qw(cluck confess);

use base qw(VRTrack::Core_obj);


=head2 fields_dispatch

  Arg [1]    : none
  Example    : my $fieldsref = $lane->fields_dispatch();
  Description: Returns hashref dispatch table keyed on database field
               Used internally for new and update methods
  Returntype : hashref

=cut

sub fields_dispatch {
    my $self = shift;

    my %fields = %{$self->SUPER::fields_dispatch()};
    %fields = (%fields,
               autoqc_id         => sub { $self->id(@_)},
               lane_id           => sub { $self->lane_id(@_)},
               test              => sub { $self->test(@_)},
               result            => sub { $self->result(@_)},
               reason            => sub { $self->reason(@_)});

    return \%fields;
}


###############################################################################
# Class methods
###############################################################################

=head2 create

  Arg [1]    : vrtrack handle to seqtracking database
  Arg [2]    : lane id that this relates to
  Example    : my $file = VRTrack::Lane->create($vrtrack, $name)
  Description: Class method.  Creates new Lane object in the database.
  Returntype : VRTrack::AutoQC object

=cut


###############################################################################
# Object methods
###############################################################################

=head2 id

  Arg [1]    : lane_id
  Example    : my $lane_id = $lane_qc->lane_id();
               $lane_qc->lane_id(104);
  Description: Get/Set for internal db ID of a lane
  Returntype : integer

=cut
sub test {
    my $self = shift;
    return $self->_get_set('test', 'string', @_);
}
sub lane_id {
    my $self = shift;
    return $self->_get_set('lane_id', 'number', @_);
}
sub result {
    my $self = shift;
    return $self->_get_set('result', 'string', @_);
}
sub reason {
    my $self = shift;
    return $self->_get_set('reason', 'string', @_);
}

1;

