;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;JALIRE^INT^1^59547,74867^0
JALIRE ;
 
 
 
 
 
 
 
LIRE(IDAR,IDOD,IDOF,OP,ER) 
 N I,ID,ARTICLE,COMPOSANT,OPERATION,JAL,OFFSET,M,TEMP,LOP,TYPE,OR
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LIRE")
 S LOP=$$CONCAS^%QZCHAD(TEMP,"LOP")
 K @(TEMP)
 S ER=0
 S ARTICLE=$$^%QSCALVA($$ART^JALRPJ,IDAR,$$AG^JALRPJ)
 I ARTICLE="" S ER=1 K @(TEMP) Q
 S COMPOSANT=IDAR_","_ARTICLE
 
 D MVG^%QSCALVA($$GAMME^JALRPJ,COMPOSANT,$$GO^JALRPJ,LOP,.TYPE)
 I @LOP=0 S ER=2 K @(TEMP) Q
 
 S OR=IDOD
 I IDOD="" S OR=$O(@LOP@(""))
 F I=1:1 Q:(OR="")!(ER'=0)  D STO Q:OR=IDOF  S OR=$O(@LOP@(OR))
 
 Q
STO S OPERATION=@LOP@(OR)
 S OP(I)=OPERATION
 S M=$$^%QSCALVA($$OP^JALRPJ,COMPOSANT_","_OPERATION,"MACHINE")
 
 I M="" S ER=3 Q
 S OP(I,0)=M,ER=0
 S JAL=$$^%QSCALVA($$OP^JALRPJ,COMPOSANT_","_OPERATION,"DATE.JALON")
 S:JAL'="" OP(I,1)=$$DH31^%QMDATE(JAL)
 Q
 
 
 
 
 
 
 
LIRE2(IDAR,IDOD,IDOF,QUANT,OP,ER) 
 N I,ID,ARTICLE,COMPOSANT,OPERATION,JAL,OFFSET,M,TEMP,LOP,TYPE,OR
 N DJ,DUFAB
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LIRE")
 S LOP=$$CONCAS^%QZCHAD(TEMP,"LOP")
 S DJ=$$DATEJAL^JALRPJ
 S DUFAB=$$DUFAB^JALRPJ
 K @(TEMP)
 S ER=0
 S ARTICLE=$$^%QSCALVA($$ART^JALRPJ,IDAR,$$AG^JALRPJ)
 I ARTICLE="" S ER=1 K @(TEMP) Q
 S COMPOSANT=IDAR_","_ARTICLE
 
 D MVG^%QSCALVA($$GAMME^JALRPJ,COMPOSANT,$$GO^JALRPJ,LOP,.TYPE)
 I @LOP=0 S ER=2 K @(TEMP) Q
 
 S OR=IDOD
 I IDOD="" S OR=$O(@LOP@(""))
 F I=1:1 Q:(OR="")!(ER'=0)  D STO2 Q:OR=IDOF  S OR=$O(@LOP@(OR))
 
 Q
STO2 S OPERATION=@LOP@(OR)
 S OP(I)=OPERATION
 S M=$$^%QSCALVA($$OP^JALRPJ,COMPOSANT_","_OPERATION,"MACHINE")
 
 I M="" S ER=3 Q
 S OP(I,0)=M,ER=0
 S JAL=$$^%QSCALVA($$OP^JALRPJ,COMPOSANT_","_OPERATION,DJ)
 S:JAL'="" OP(I,1)=$$DH31^%QMDATE(JAL)
 S M=$$^%QSCALVA($$OP^JALRPJ,COMPOSANT_","_OPERATION,DUFAB)
 I M="" S ER=4 Q
 S OP(I,2)=QUANT*M
 Q

