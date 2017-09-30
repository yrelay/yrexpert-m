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

;%PBPZPR^INT^1^59547,73874^0
PTZPR ;
 
 
 
 
 
 
OPEN(%PORT,%TERM) 
 O %PORT::10
 E  Q $$^%QZCHW("la porte")_" "_%PORT_" "_$$^%QZCHW("n'est pas disponible, veuillez reessailler plus tard, merci")
 Q ""
 
CLOSE(%PORT,%TERM) 
 C %PORT
 Q
 
 
FLUSH(%PORT,%TERM) 
 N %FONC
 S %FONC="PRINTER" D ^%PBPZ Q
 
 
 
INIT(%PORT,%TERM) 
 N %FONC
 S %FONC="INIT" D ^%PBPZ Q
 
 
 
CLEAR(%PORT,%TERM) 
 N %FONC
 S %FONC="CLEAR" D ^%PBPZ Q
 
 
END(%PORT,%TERM) 
 N %FONC
 S %FONC="PRINTER" D ^%PBPZ Q
 
 
 
PLACER(%PORT,%TERM,%9T,%9X,%9Y,%9STR) 
 N %FONC
 S %FONC="TAILLE" D ^%PBPZ
 S %FONC="MOUV" D ^%PBPZ
 S %FONC="TEXT" D ^%PBPZ
 Q
 
 
 
TAILLE(%PORT,%TERM,%9T) 
 N %FONC
 S %FONC="TAILLE" D ^%PBPZ
 Q
 
 
 
 
TRAIT(%PORT,%TERM,%9EPA,%9X1,%9Y1,%9X2,%9Y2) 
 N %FONC
 S %FONC="SEGMENT.TEXTE" D ^%PBPZ
 Q
 
 
 
 
CADRE(%PORT,%TERM,%9EPA,%9X1,%9Y1,%9X2,%9Y2) 
 N %FONC
 S %FONC="CADRE" D ^%PBPZ
 Q
 
 
 
 
HACHURER(%PORT,%TERM,%9EPA,%9X1,%9Y1,%9X2,%9Y2) 
 N %FONC
 S %FONC="HACHURER" D ^%PBPZ
 Q
 
 
 
 
HACHUREF(%PORT,%TERM,%9EPA,%9X1,%9Y1,%9X2,%9Y2) 
 N %FONC
 S %FONC="HACHURER.FORT" D ^%PBPZ
 Q
 
 
 
 
 
 
 
GRIS(X,Y,L,H,P) 
 I P="" S P=1
 D PLACER^%PBPZPR(IMP,"HP-KYO",P,X,Y-4E-1,"") U IMP W !
 N U S U=118110236E-6
 S L=(L*U)\1
 S H=(H*U)\1
 U IMP W *27,*42,*99,L,*65
 U IMP W *27,*42,*99,H,*66
 U IMP W *27,*42,*99,10,*71
 U IMP W *27,*42,*99,2,*80
 U IMP W !
 Q
 
 
 
GRISF(X,Y,L,H,P) 
 I P="" S P=1
 D PLACER^%PBPZPR(IMP,"HP-KYO",P,X,Y-4E-1,"") U IMP W !
 N U S U=118110236E-6
 S L=(L*U)\1
 S H=(H*U)\1
 U IMP W *27,*42,*99,L,*65
 U IMP W *27,*42,*99,H,*66
 U IMP W *27,*42,*99,40,*71
 U IMP W *27,*42,*99,2,*80
 U IMP W !
 Q
 
 
LIGNE(IMP,X,Y,L,EP) 
 D PLACER^%PBPZPR(IMP,"HP-KYO",1,X,Y-4E-1,"") U IMP W !
 N U S U=118110236E-6
 S:EP="" EP=1E-1
 S L=(L*U)\1
 S EP=(EP*U)\1
 U IMP W *27,*42,*99,L,*65
 U IMP W *27,*42,*99,EP,*66
 U IMP W *27,*42,*99,0,*80
 U IMP W !
 Q
LIGNEV(IMP,X,Y,L,EP) 
 D PLACER^%PBPZPR(IMP,"HP-KYO",1,X,Y-4E-1,"") U IMP W !
 N U S U=118110236E-6
 S:EP="" EP=1E-1
 S L=(L*U)\1
 S EP=(EP*U)\1
 U IMP W *27,*42,*99,EP,*65
 U IMP W *27,*42,*99,L,*66
 U IMP W *27,*42,*99,0,*80
 U IMP W !
 Q

