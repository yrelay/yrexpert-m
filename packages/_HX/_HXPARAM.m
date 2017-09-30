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

;%HXPARAM^INT^1^59547,73870^0
HXPARAM ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ECHEL(VAL,CTR,I) 
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Hauteur des colonnes")_" ["_VAL_"] : ","",1,RM-4,DY+1,DY-1,"","$$UC^%HXPARAM",.CTR,.I)
 I CTR'="" S CTR=0
 D ^%VZEATT
 Q
 
UC(YY1,REAF) 
 S REAF=0
 I YY1="" Q 1
 I (YY1'?.N)!(YY1'>0) D ^%VSQUEAK Q 0
 Q 1
 
 
LARG(LHIST,ECART,VAL,NBCOL,CTR) 
 N I
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Largeur des colonnes")_" ["_VAL_"] : ","",1,RM-4,DY+1,DY-1,"","$$UC^%HXPARAM",.CTR,.I)
 I ((CTR'="")!(I=""))!(I=VAL) S CTR=0 Q
 S VAL=I I VAL>(LHIST-3) S VAL=LHIST-3
 S NBCOL=LHIST\(VAL+ECART) S:(NBCOL*(VAL+ECART))<LHIST NBCOL=NBCOL+1
 Q
 
 
PAS(VAL,CTR,I) 
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Quel pas")_" ["_VAL_"] : ","",1,RM-4,DY+1,DY-1,"","$$UCP^%HXPARAM",.CTR,.I)
 I CTR'="" S CTR=0
 D ^%VZEATT
 Q
 
UCP(YY1,REAF) 
 S REAF=0
 I YY1="" Q 1
 I '($$NUM^%QZNBN(YY1)) D ^%VSQUEAK Q 0
 Q 1
 
 
DATE(ATR,REP,ROUT,VAL,CTR,I) 
 S VAL=$$^%QSCALIN("ATTRIBUT",ATR_"/"_$$NOMLOG^%QSF(REP),"DERNIER.FORMAT.UTILISE",$I)
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Quel format")_" ["_VAL_"] : ","",1,RM-4,DY+1,DY-1,ROUT,"$$UCD^%HXPARAM",.CTR,.I)
 I CTR'="" S CTR=0
 D ^%VZEATT
 Q
 
UCD(YY1,REAF) 
 S REAF=0
 I YY1="" Q 1
 I YY1="?" S REAF=1 D LIST^%QMDAUC Q 0
 I '($$COR^%QMDAUC(R,REPR,.YY1)) Q 0
 Q 1
 
 
MENU(MEN) 
 K @(MEN)
 S @MEN@(1)=$$^%QZCHW("Gauche")_"^GAUCH"
 S @MEN@(2)=$$^%QZCHW("Droite")_"^DROIT"
 S @MEN@(3)=$$^%QZCHW("Largeur")_"^LARGE"
 S @MEN@(4)=$$^%QZCHW("Hauteur")_"^ECHEL"
 S @MEN@(5)=$$^%QZCHW("Entree")_"^ENTRE"
 S @MEN@(6)=$$^%QZCHW("Acces.direct")_"^DIRECT"
 Q
 
MEN2(MEN) 
 K @(MEN)
 S @MEN@(1)=$$^%QZCHW("Deplacer colonne")_"^DEPL"
 S @MEN@(2)=$$^%QZCHW("Eclater individu")_"^ECL"
 S @MEN@(3)=$$^%QZCHW("Attributs")_"^"_"GEST"
 S @MEN@(4)=$$^%QZCHW("Autres")_"^"_"MEN"
 Q
 
 
ACCES(ATR,NUM,INVC,CTR,I) 
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD(ATR_" "_$$^%QZCHW("de la colonne")_" : ","",1,RM-4,DY+1,DY-1,"","",.CTR,.I)
 D ^%VZEATT
 I CTR'="" S CTR=0
 Q:(I="")!(CTR=0)
 D NORMALIS^%QZNBN1(.I)
 Q:$D(@INVC@(I))
 I NUM S I=$ZP(@INVC@(I)) Q
 S I=$O(@INVC@(I))
 Q
 
 
INV(GL,INVC) 
 K @(INVC)
 F I=1:1:@GL S @INVC@(@GL@(I,"TEXT"))=I
 Q
 
 
SELINDI(R,T,ROUT,COL,L) 
 
 
 
 
 
 
 N CH,LO,LCOLS,I,%I
 S LO=0,COL="^DESC($J)"
 I ROUT'="" S ^DESC($J,"PROG")=ROUT
 S ^DESC($J,"MSG")=$$^%QZCHW("Colonne : ")_@GL@(CS,"TEXT")
 S ^DESC($J,"TITC")=$$^%QZCHW("Individu")
 S ^DESC($J,"MODI")=1
 S ^DESC($J,"INTER")=1
 D CLEPAG^%VVIDEO,^%VZEATT
 
 S L=0,I=""
 F %I=0:0 S I=$O(@GL@(CS,"IND",I)) Q:I=""  D TI
 S LO=LO\1,LCOLS=((80-LO)-10)\2
 S ^DESC($J,"LGC")=LO
 S ^DESC($J,"COL",1)=$$^%QZCHW(T)_"^"_LCOLS_"^"_T
 S ^DESC($J,"COL",2)=$$^%QZCHW(R)_"^"_LCOLS_"^"_R
 S ^DESC($J,"COL",3)="~^"_LCOLS_"^"_"INDIVIDU"
 Q
TI 
 S CH=@GL@(CS,"IND",I),L=L+1
 S ^DESC($J,L)=$$S^%QAX(I)
 S LO=((LO*(L-1))+$L(^DESC($J,L)))/L
 S ^DESC($J,L,T)=$P(CH,"^",1)
 S ^DESC($J,L,R)=$P(CH,"^",2)
 S ^DESC($J,L,"INDIVIDU")=I
 Q

