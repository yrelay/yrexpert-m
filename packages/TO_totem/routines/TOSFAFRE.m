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

;TOSFAFRE^INT^1^59547,74875^0
TOSFAFRE ;
 
 
 
 S %AJCMS="",NOMTAB="^[QUI]"_%DOM,SCR=%DOM,ROUTI="^%VMULTGE(.IFLAG)",NOMPROG=$T(+0)
 S NOMAP=$E(NOMPROG,4,$L(NOMPROG)),NOMPROG="^"_NOMPROG
 S NOMAJ="^AJ"_NOMAP,CMS=0 D ACTI
 I OK D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR,POCLEPA^%VVIDEO W "[RETURN]" R *BIDON
 I '(OK) D AFABAC
 K CMS U 0 K %AJCMS,I,IC,NA,NOMA,NOMAJ,NOMAP,NOMPROG,NOMTAB,NT,NUMA,OK,ROUTI,SCR Q
ACTI K RESUL S OK=1,RESUL(1)=%ART
 S @("RESUL(2)="_$P(%REF,",",1)) I RESUL(2)["$ARG" S @("RESUL(1)="_$P(^[QUI]DEPARG(%ART,RESUL(2)),",",1)),@("RESUL(2)="_$P(^[QUI]DEPARG(%ART,RESUL(2)),",",2))
 I RESUL(2)["%VALABAC" S OK=0 Q
 I $P(%REF,",",1)=(""""_RESUL(2)_"""") S NT=NOMTAB_"("""_RESUL(1)_""","""_RESUL(2)_""","_$P(%REF,",",2)_")"
 E  S N=$N(@(NOMTAB_"("""_RESUL(1)_""","""_RESUL(2)_""",-1)")),NT=NOMTAB_"("""_RESUL(1)_""","""_RESUL(2)_""","_N_")"
 S RESUL(3)=$P(@NT,"^",1),RESUL(4)=$P(%REF,",",2)
 F IC=5:1 Q:'($D(^%SCRE(SCR,IC)))  S RESUL(IC)=$P(@NT,"^",IC-3)
 Q
AFABAC D POCLEPA^%VVIDEO W $$^%QZCHW("Il s'agit de l'abaque ") S NA=$N(^[QUI]SSGRGRI($P(RESUL(2),".",2),$P(RESUL(2),".",3),-1)),NUMA=^[QUI]SSGRGRI($P(RESUL(2),".",2),$P(RESUL(2),".",3),NA)
 S NOMA=$P(^[QUI]GROUGRIL(NUMA),"^",1),NOMA=$P(NOMA,"|",2) W NOMA,"  [RETURN]" R *BIDON Q

