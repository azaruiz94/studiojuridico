class Ability
  include CanCan::Ability

  def initialize(usuario)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    usuario ||= Usuario.new # guest user (not logged in)
      if usuario.name_role? "admin" #if user.has_role?
        can :manage, :all
      end
      
      # Acciones Para Procesos
      if usuario.can_do? "Ver Procesos"
        can [:read, :show], [Proceso, ProcesoDetalle]
      end
      if usuario.can_do? "Crear Procesos"
        can [:create, :show], [Proceso, ProcesoDetalle]
      end
      if usuario.can_do? "Editar Procesos"
        can [:edit, :read], [Proceso, ProcesoDetalle]
      end
      if usuario.can_do? "Eliminar Procesos"
        can :destroy, [Proceso, ProcesoDetalle]
      end

      # Acciones Para Juicios
      if usuario.can_do? "Ver Juicios"
        can [:read, :show], [Juicio, Actuacion]
      end
      if usuario.can_do? "Crear Juicios"
        can [:create, :show], [Juicio, Actuacion]
      end
      if usuario.can_do? "Editar Juicios"
        can [:edit, :read], [Juicio, Actuacion]
      end
      if usuario.can_do? "Eliminar Juicios"
        can :destroy, [Juicio, Actuacion]
      end

      # Acciones Para clientes
      if usuario.can_do? "Ver Clientes"
        can [:read, :show], [Cliente]
      end
      if usuario.can_do? "Crear Clientes"
        can [:create, :show], [Cliente]
      end
      if usuario.can_do? "Editar Clientes"
        can [:edit, :read], [Cliente]
      end
      if usuario.can_do? "Eliminar Clientes"
        can :destroy, [Cliente]
      end

      # Acciones Para empleados
      if usuario.can_do? "Ver Empleados"
        can [:read, :show], [Empleado]
      end
      if usuario.can_do? "Crear Empleados"
        can [:create, :show], [Empleado]
      end
      if usuario.can_do? "Editar Empleados"
        can [:edit, :read], [Empleado]
      end
      if usuario.can_do? "Eliminar Empleados"
        can :destroy, [Empleado]
      end

      # Acciones Para institucion
      if usuario.can_do? "Ver Instituciones"
        can [:read, :show], [Institucion]
      end
      if usuario.can_do? "Crear Instituciones"
        can [:create, :show], [Institucion]
      end
      if usuario.can_do? "Editar Instituciones"
        can [:edit, :read], [Institucion]
      end
      if usuario.can_do? "Eliminar Instituciones"
        can :destroy, [Institucion]
      end

      # Acciones Para objetos
      if usuario.can_do? "Ver Objetos"
        can [:read, :show], [Juicio, Objeto]
      end
      if usuario.can_do? "Crear Objetos"
        can [:create, :show], [Objeto]
      end
      if usuario.can_do? "Editar Objetos"
        can [:edit, :read], [Objeto]
      end
      if usuario.can_do? "Eliminar Objetos"
        can :destroy, [Objeto]
      end

      # Acciones Para ciudades
      if usuario.can_do? "Ver Ciudades"
        can [:read, :show], [Ciudad]
      end
      if usuario.can_do? "Crear Ciudades"
        can [:create, :show], [Ciudad]
      end
      if usuario.can_do? "Editar Ciudades"
        can [:edit, :read], [Ciudad]
      end
      if usuario.can_do? "Eliminar Ciudades"
        can :destroy, [Ciudad]
      end

      # Acciones Para departamentos
      if usuario.can_do? "Ver Departamentos"
        can [:read, :show], [Departamento]
      end
      if usuario.can_do? "Crear Departamentos"
        can [:create, :show], [Departamento]
      end
      if usuario.can_do? "Editar Departamentos"
        can [:edit, :read], [Departamento]
      end
      if usuario.can_do? "Eliminar Departamentos"
        can :destroy, [Departamento]
      end
  end
end
