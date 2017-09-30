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

;%QUECZ1^INT^1^59547,73885^0
QUECZ1 ;
 
 
 
 
 
 
 
 
 
FDCO(CL,FD,TYPE,VAL) 
 N I,FD1
 S FD1=$$FD1^%QUECZ1(CL,FD)
 S TYPE=@FD1@("TYPE")
 I TYPE="RECTANGLE" G FDCOREC
 I TYPE="COMMENTAIRE" G FDCOCOM
 Q
FDCOREC F I="XG","YH","H","L" S @VAL@(I)=@FD1@(I)
 Q
FDCOCOM S @VAL@("MODAFF")=$$CONCAT^%QZCHAD(FD1,"""MODAFF""")
 F I="XG","YH","LIB" S @VAL@(I)=@FD1@(I)
 Q
 
 
 
 
 
FGCO(CL,VAL) 
 N I,FG
 S FG=$$FGLOB^%QUECZ1(CL)
 F I="XG","YH","H","L" S @VAL@(I)=@FG@(I)
 Q
 
 
 
 
 
 
 
CHCO(CL,CH,TYPE,VAL) 
 N I,CH1
 S CH1=$$CH^%QUECZ1(CL)
 S TYPE=@CH1@(CH,"TYPE")
 I TYPE="TEXTE" G CHCOTX
 I TYPE="VALEUR" G CHCOVA
 Q
CHCOVA F I="XG","YH","H","L","LIB" S @VAL@(I)=@CH1@(CH,I)
 Q
CHCOTX F I="XG","YH","H","L" S @VAL@(I)=@CH1@(CH,I)
 Q
 
ECR() Q "^%ECRAN"
 
FGLOB(CL) Q "^%ECRAN("_$$S1^%QZCHAD(CL)_",""FGLOB"")"
 
FD(CL) Q "^%ECRAN("_$$S1^%QZCHAD(CL)_",""FOND"")"
FD1(CL,I) Q "^%ECRAN("_$$S1^%QZCHAD(CL)_",""FOND"","_$$S1^%QZCHAD(I)_")"
 
MODAFF(CL,FD) Q "^%ECRAN("_$$S1^%QZCHAD(CL)_",""FOND"","_$$S1^%QZCHAD(FD)_",""MODAFF"")"
 
CH(CL) Q "^%ECRAN("_$$S1^%QZCHAD(CL)_",""CHAMPS"")"
 
UC(CL,CH) Q "^%ECRAN("_$$S1^%QZCHAD(CL)_",""CHAMPS"","_$$S1^%QZCHAD(CH)_",""UC"")"
 
CP(CL) Q "^%ECRAN("_$$S1^%QZCHAD(CL)_",""CP"")"
 
CURCP(CL) 
 Q "^%ECRAN("_$$S1^%QZCHAD(CL)_",""CP"",""CURCP"")"

