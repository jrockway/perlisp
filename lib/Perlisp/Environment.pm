package Perlisp::Environment;
use Moose;
use MooseX::AttributeHelpers;

has parent => (
    is        => 'ro',
    isa       => 'Perlisp::Environment',
    predicate => 'has_parent',
);

has bindings => (
    metaclass => 'Collection::Hash',
    is        => 'ro',
    isa       => 'HashRef',
    default   => sub { {} },
    provides  => {
        get    => '_lookup',
        set    => 'bind',
        exists => 'has_binding',
    },
);

sub lookup {
    my $self = shift;
    my $name = shift;

    return $self->_lookup($name)
        if $self->has_binding($name);

    return $self->parent->lookup($name, @_)
        if $self->has_parent;

    return;
}

sub subenv {
    my $self = shift;

    my $subenv = blessed($self)->new(parent => $self);
    $subenv->bind(@_);

    return $subenv;
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

