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
;! Nomprog     : %INCCLAV                                                     !
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

%INCCLAV ;
 
 
 
 
 
 
 
 
 
 Q:$D(^%INCONNE("CLAVIER"))
 N %I
 
 F %I=-1:1:255 S ^%INCONNE("CLAVIER","FLECHE",%I)="",^%INCONNE("CLAVIER","TOUCHE",%I)=%I,^%INCONNE("CLAVIER","TOUCHE.VT200",%I)=%I,^%INCONNE("CLAVIER","TOUCHE.VT100",%I)=%I
 ;;-------------------- FLECHES
 S ^%INCONNE("CLAVIER","TOUCHE",1)=0,^%INCONNE("CLAVIER","FLECHE",1)="H",^%INCONNE("CLAVIER","CODE.FLECHE","H")=65
 S ^%INCONNE("CLAVIER","TOUCHE",11)=0,^%INCONNE("CLAVIER","FLECHE",11)="B",^%INCONNE("CLAVIER","CODE.FLECHE","B")=66
 S ^%INCONNE("CLAVIER","TOUCHE",14)=0,^%INCONNE("CLAVIER","FLECHE",14)="G",^%INCONNE("CLAVIER","CODE.FLECHE","G")=68
 S ^%INCONNE("CLAVIER","TOUCHE",18)=0,^%INCONNE("CLAVIER","FLECHE",18)="D",^%INCONNE("CLAVIER","CODE.FLECHE","D")=67
 ;;-------------------- CONTROLES
 
 S ^%INCONNE("CLAVIER","TOUCHE",27)=1
 S ^%INCONNE("CLAVIER","TOUCHE.VT200",0)=1
 S ^%INCONNE("CLAVIER","TOUCHE.VT100",0)=1
 
 S ^%INCONNE("CLAVIER","TOUCHE",20)=28
 S ^%INCONNE("CLAVIER","TOUCHE.VT200",20)=28
 S ^%INCONNE("CLAVIER","TOUCHE.VT100",20)=28
 
 S ^%INCONNE("CLAVIER","TOUCHE",15)=14
 S ^%INCONNE("CLAVIER","TOUCHE.VT200",15)=14
 S ^%INCONNE("CLAVIER","TOUCHE.VT100",15)=14
 
 S ^%INCONNE("CLAVIER","TOUCHE",23)=18
 S ^%INCONNE("CLAVIER","TOUCHE.VT200",23)=18
 S ^%INCONNE("CLAVIER","TOUCHE.VT100",23)=18
 ;;------------------- TOUCHES SPEC. MOZART
 
 S ^%INCONNE("CLAVIER","TOUCHE",31)=27
 S ^%INCONNE("CLAVIER","ESCAPE",31)="*OP"
 S ^%INCONNE("CLAVIER","ESCAPE.VT200","*[31~")="*OP"
 S ^%INCONNE("CLAVIER","ESCAPE.VT200","*Oc")="*OP"
 
 S ^%INCONNE("CLAVIER","TOUCHE",248)=27
 S ^%INCONNE("CLAVIER","ESCAPE",248)="*OQ"
 S ^%INCONNE("CLAVIER","ESCAPE.VT200","*[32~")="*OQ"
 S ^%INCONNE("CLAVIER","ESCAPE.VT200","*O"_$C(155))="*OQ"
 
 S ^%INCONNE("CLAVIER","TOUCHE",243)=27
 S ^%INCONNE("CLAVIER","ESCAPE",243)="*OR"
 S ^%INCONNE("CLAVIER","ESCAPE.VT200","*[33~")="*OR"
 S ^%INCONNE("CLAVIER","ESCAPE.VT200","*O"_$C(145))="*OR"
 
 S ^%INCONNE("CLAVIER","TOUCHE",228)=27
 S ^%INCONNE("CLAVIER","ESCAPE",228)="*OS"
 S ^%INCONNE("CLAVIER","ESCAPE.VT200","*[34~")="*OS"
 S ^%INCONNE("CLAVIER","ESCAPE.VT200","*O"_$C(149))="*OS"
 
 S ^%INCONNE("CLAVIER","TOUCHE",229)=27
 S ^%INCONNE("CLAVIER","ESCAPE",229)="*Op"
 
 S ^%INCONNE("CLAVIER","TOUCHE",234)=27
 S ^%INCONNE("CLAVIER","ESCAPE",234)="*Oq"
 
 S ^%INCONNE("CLAVIER","TOUCHE",230)=27
 S ^%INCONNE("CLAVIER","ESCAPE",230)="*Or"
 
 S ^%INCONNE("CLAVIER","TOUCHE",130)=27
 S ^%INCONNE("CLAVIER","ESCAPE",130)="*Os"
 
 S ^%INCONNE("CLAVIER","TOUCHE",241)=27
 S ^%INCONNE("CLAVIER","ESCAPE",241)="*Ot"
 
 S ^%INCONNE("CLAVIER","TOUCHE",226)=27
 S ^%INCONNE("CLAVIER","ESCAPE",226)="*Ou"
 
 S ^%INCONNE("CLAVIER","TOUCHE",25)=27
 S ^%INCONNE("CLAVIER","ESCAPE",25)="*Ov"
 
 S ^%INCONNE("CLAVIER","TOUCHE",28)=27
 S ^%INCONNE("CLAVIER","ESCAPE",28)="*Ow"
 
 S ^%INCONNE("CLAVIER","TOUCHE",29)=27
 S ^%INCONNE("CLAVIER","ESCAPE",29)="*Ox"
 
 S ^%INCONNE("CLAVIER","TOUCHE",30)=27
 S ^%INCONNE("CLAVIER","ESCAPE",30)="*Oy"
 
 S ^%INCONNE("CLAVIER","TOUCHE",237)=27
 S ^%INCONNE("CLAVIER","ESCAPE",237)="*Om"
 
 S ^%INCONNE("CLAVIER","TOUCHE",227)=27
 S ^%INCONNE("CLAVIER","ESCAPE",227)="*Ol"
 
 S ^%INCONNE("CLAVIER","TOUCHE",247)=27
 S ^%INCONNE("CLAVIER","ESCAPE",247)="*OM"
 Q
 
TUER 
 K ^%INCONNE("CLAVIER")
 Q
 
 
 
 
TOUCHE(ENT,SOR) 
 Q:'$D(^%INCONNE("CLAVIER",CLTOUC,ENT))
 S SOR=^%INCONNE("CLAVIER",CLTOUC,ENT)
 Q
 
 
 
 
 
 
 
 
 
FLECHE(ENT,X1,X2,X3) 
 N %F
 S %F=^%INCONNE("CLAVIER","FLECHE",ENT)
 Q:%F="" 0
 S X1=27,X2=91,X3=^%INCONNE("CLAVIER","CODE.FLECHE",%F)
 Q 1
 
 
 
 
 
 
 
CODFLEC(ENT,L) 
 S L=^%INCONNE("CLAVIER","FLECHE",ENT)
 Q L'=""
 
 
 
 
 
ESCAPE(ENT) 
 Q:'($D(^%INCONNE("CLAVIER",CLESCP,ENT))) ENT
 Q ^%INCONNE("CLAVIER",CLESCP,ENT)

