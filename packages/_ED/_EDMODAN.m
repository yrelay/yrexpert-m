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

;%EDMODAN^INT^1^59547,73869^0
EDMODANS ;
 
 
 
 
SU N TETE
 S TETE=$$VAL^%QULYSTE("TETE") I TETE'="" D KILL^%ANA(TETE)
 S OK=1 Q
AJ N CHAINE,TETE,POSIT,SX,SY,VVDX,VVDY,VVYB,VVYH,VVPA,VVTX,ATTD,APPD,APPEX,%IC
 S CHAINE=Y1,POSIT=1,SX=DX,SY=DY D INIT^%AN7(SX,SY)
 S TETE=$$VAL^%QULYSTE("TETE") I TETE'="" D KILL^%ANA(TETE)
 
 N %COMPIL,%ETIQ
 S (%COMPIL,%ETIQ)="",(ATTD,APPD,APPEX)=0
 S OK=$$MODELE^%AN9(CHAINE)
 I '(OK) G AJ2
 
 F %IC=1:1 Q:$$VAL^%QULIMO("ATTRIBUT."_%IC)=""  D DEL^%QULIMO("ATTRIBUT."_%IC)
 F %IC=1:1 Q:$$VAL^%QULIMO("APPEL."_%IC)=""  D DEL^%QULIMO("APPEL."_%IC)
 D AFF^%QULIMO("NBR.ATTRIBUTS",ATTD)
 D AFF^%QULIMO("NBR.APPELS",APPD)
 D AFF^%QULIMO("NBR.APPELS.CALCULES",APPEX)
 F %IC=1:1:ATTD D AFF^%QULIMO("ATTRIBUT."_%IC,ATTD(%IC))
 F %IC=1:1:APPD D AFF^%QULIMO("APPEL."_%IC,APPD(%IC))
 S DX=SX,DY=SY X XY
 S OK=1 S:%COMPIL=" " %COMPIL=""
 S ^[QUI]EDMOD(MOD,"COMP",P1C)=%COMPIL
AJ2 K ATTD,APPD
 S Y1=CHAINE
 Q

