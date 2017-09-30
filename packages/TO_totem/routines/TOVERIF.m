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

;TOVERIF^INT^1^59547,74876^0
TOVERIF D ZD^%QMDATE4
 
 D ECHON^%VVIDEO U 0 D CLEPAG^%VVIDEO W !,!,!,$$^%QZCHW("Quel Article voulez-vous verifier ? ") R ARX Q:ARX=""
 K DEJVU
 S NT="EXPLICI^IMPLICI^NOMENC^PHASE^FORMULE^PRIX^IMPMAT"
 S ST="EXPLICI^IMPLICI^NOMENC^PHASE^FORMULE^PRIX^IMPMAT"
 F Z=1:1 S NOMTAB=$P(NT,"^",Z) Q:NOMTAB=""  S SCR=$P(ST,"^",Z),NOMTAB="^[QUI]"_$S($D(^NAMEFUL(NOMTAB)):$P(^NAMEFUL(NOMTAB),"^",1),1:NOMTAB),ROUTI="^%VMULTGE(.IFLAG)" I '($D(DEJVU(NOMTAB))) D CORV S ^DEJVU(NOMTAB)=1
 G FIN
CORV 
 S NOMPROG=$T(+0)
 S NOMAP=$E(NOMPROG,4,$L(NOMPROG)),NOMPROG="^"_NOMPROG
 S NOMAJ="^AJ"_NOMAP
 S CMS=0 D CLEPAG^%VVIDEO F I=1:1:^%SCRE(SCR) S RESUL(I)=""
 I NOMTAB'["SECTION" S RESUL(1)=ARX
 S IOP=^TABIDENT(WHOIS,"PRINTER") D ^%IS,^TOLISCOR
 I IOP'=0 C IOP O IOP U IOP W # C IOP
 Q
FIN K CMS,DEJVU U 0 Q

