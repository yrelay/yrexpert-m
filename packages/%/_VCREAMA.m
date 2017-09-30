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

;%VCREAMA^INT^1^59547,74034^0
GECREAMA ;;09:43 AM  8 Jan 1996
 
 S TB="^AFF($I)",^AFF($I,1)=0
ENT S %POL=80 D CURRENT^%IS,CLEPAG^%VVIDEO S DX=0,DY=0 X XY D CAG^%VVIDEO S MSG=$$PCONF^%INCASTO("NOMHOST")_" - YEXPERT ("_^INCONNE("VERSION")_")",DX=20-($L(MSG)\2) X XY W MSG S DYH=5,MSG="Creation de masques",DXG=20-($L(MSG)\2) D BIG^%VVIDEO
GRI D POCLEPA^%VVIDEO W " Nom de l 'Image (ou xx? ou xx*) " S DX=$X D ^%VLEC G FIN:Y1="" I Y1["?" S KEY=$P(Y1,"?",1),KEY=$S(KEY="":"",1:$E(KEY,1,$L(KEY)-1)_$C($A($E(KEY,$L(KEY))-1))_"z") W " Un instant..." D ^%VCREM01(KEY,"") G LIG:OK=1,ENT
 I Y1["*" S KEY=$P(Y1,"*",1) G GRI:KEY="" S KE=KEY,KEY=$S(KEY="":"",1:$E(KEY,1,$L(KEY)-1)_$C($A($E(KEY,$L(KEY))-1))_"z") W " Un instant..." D ^%VCREM01(KEY,KE) G LIG:OK=1,ENT
 I $D(^MASQUE(Y1)) S SCR=Y1 G LIG
 D VERI G GRI:'(OK)
SIOK D POCLEPA^%VVIDEO W "OK pour la creation de ",Y1," (O/N) " R *X:60 G FIN:X=-1 S X=$C(X) G SIOK:(X'="O")&(X'="N"),GRI:X="N" S SCR=Y1,^MASQUE(SCR)=0,^MASQUEC(SCR)=0 G LIG
VERI S OK=1,%W=$L(Y1) F %U=1:1:%W S %V=$A($E(Y1,%U)),OK=$S(%V<48:0,(%V>57)&(%V<65):0,%V>90:0,1:1) Q:'(OK)
 S:$A($E(Y1,1))<65 OK=0 Q
LIG S M=SCR D ^%VCREM02
PAG D POCLEPA^%VVIDEO W "PAGE ? " R PAGE D:PAGE="D" DUPLPAGE G:PAGE="" ENDBIS G:(PAGE+0)'=PAGE PAG
 D:$D(^MASQUE(SCR,"DESC",PAGE))=0 INITPAGE
 D ^%VCREM08
LIGNE S %POL=$S($D(^MASQUE(M,"POLICE")):^MASQUE(M,"POLICE"),1:80) S:%POL="" %POL=80 D:%POL=132 132^%VVIDEO
 I $D(^MASQUE(M,"POSITION")) S J=^MASQUE(M,"POSITION"),%LIXG=$P(J,",",1),%LIYH=$P(J,",",2),%LIXD=$P(J,",",3),%LIYB=$P(J,",",4) G LIGS
 S %LIXG=-1,%LIYH=-1,%LIYB=24,%LIXD=%POL
LIGS D CLEPAG^%VVIDEO
 F IT="%LIXG,%LIYH","%LIXD,%LIYH","%LIXG,%LIYB","%LIXD,%LIYB" S DX=@$P(IT,",",1),DY=@$P(IT,",",2) I (DX'<0)&(DY'<0) X XY W "+"
 S SCR=M I ($D(^MASQUE(SCR,"DESC",PAGE))#10)=1 D ^%VAFIMAS(SCR,PAGE,TB)
LIGNE1 
 D POCLEPA^%VVIDEO W "No de Champ et Code : " S DX=$X D ^%VLEC G DIM:CTRLL,AUTR:CTRLE,RAFF:CTRLR,DEF:CTRLB,HELP:CTRLH I Y1="" D ZD^%QMDATE4,^%QMDAHEU S ^MASQUE(M,"DERNIER ACCES")=%DAT_" a "_HEURE G END
 I Y1="COMMENT" D ^%VCREM03 S (C,PX,PY)="" D COMP^%VCOMPMA(SCR),DESC^%VCOMPMA(SCR) G LIGNE1
 D ^%VCREM06(Y1) G LIGNE1
ENDBIS D COMP^%VCOMPMA(SCR)
 D DESC^%VCOMPMA(SCR)
 G GECREAMA
END D CLEPAG^%VVIDEO D:%POL=132 80^%VVIDEO D TESTPAGE G PAG
AUTR D POCLEPA^%VVIDEO W "Grille " S DX=$X D ^%VLEC G LIGNE1:Y1="" D VERI G AUTR:'(OK),AUTR:'($D(^MASQUE(Y1))) S SCR=Y1 D ^%VAFIMAS(SCR,PAGE,TB) S SCR=M G LIGNE1
RAFF G:($D(^MASQUE(SCR))#10)'=1 LIGNE1 D ^%VAFIMAS(SCR,PAGE,TB) G LIGNE1
DIM D ^%VCREM04("NOLIB",.C) G LIGNE1
DEF D ^%VCREM02
 D POCLEPA^%VVIDEO W "PAGE ? " R PAGE
 D:$D(^MASQUE(SCR,"DESC",PAGE))=0 INITPAGE
 D ^%VCREM08,^%VAFIMAS(SCR,PAGE,TB) G LIGNE1
HELP K ^POS($J) S MEN=$P($S('(DTM):$T(MENH),MODTM:$T(MENHD),1:$T(MENHA)),";;",2) F %U=1:1 S %V=$P(MEN,"/",%U) Q:%V=""  S ^POS($J,%U)=%V
 D ^%VGENMEN(5,6,5,"^POS($J)"),CLEPAG^%VVIDEO
 S DYH=2,MSG="Fonctions disponiblees",DXG=20-($L(MSG)\2) D BIG^%VVIDEO,SEL^%VGENMEN(.ADR,.CTRL),CLEPAG^%VVIDEO,^%VAFIMAS(SCR,PAGE,TB)
 G:ADR'="" @ADR G RAFF:CTRL="R",AUTR:CTRL="E",DIM:CTRL="L",DEF:CTRL="B",END:CTRL="A",LIGNE1
FIN Q
MENH ;;CTRLA Abandon^END/CTRLB Definition de l'image^DEF/CTRLL prendre des reperes^DIM/CTRLE Afficher un autre masque^AUTR/CTRLR Rafraichissement de l'image^RAFF/Champ x suivi de ,I ou ,S ou ,M ou ,R ou ,P ou ,?^LIGNE1
MENHD ;;ESCP Abandon^END/CTRLB Definition de l'image^DEF/CTRLL prendre des reperes^DIM/CTRLE Afficher un autre masque^AUTR/CTRLW Rafraichissement de l'image^RAFF/Champ x suivi de ,I ou ,S ou ,M ou ,R ou ,P ou ,?^LIGNE1
MENHA ;;BREAK Abandon^END/CTRLB Definition de l'image^DEF/CTRLL prendre des reperes^DIM/CTRLE Afficher un autre masque^AUTR/CTRLW Rafraichissement de l'image^RAFF/Champ x suivi de ,I ou ,S ou ,M ou ,R ou ,P ou ,?^LIGNE1
 
INITPAGE 
 S ^MASQUE(SCR,"DESC")=$S($D(^MASQUE(SCR,"DESC")):^MASQUE(SCR,"DESC"),1:0)+1
 S ^MASQUE(SCR)=$S($D(^MASQUE(SCR)):^MASQUE(SCR),1:0)+1
 S ^MASQUEC(SCR)=^MASQUE(SCR)
 S ^MASQUEC(SCR,"DESC")=^MASQUE(SCR,"DESC")
 S ^MASQUE(SCR,"MASQUE")=^MASQUE(SCR,"DESC")
 S ^MASQUEC(SCR,"MASQUE")=^MASQUE(SCR,"DESC")
 S ^MASQUE(SCR,"DESC",PAGE)=0
 S ^MASQUE(SCR,"MASQUE",PAGE)=0
 S ^MASQUEC(SCR,"MASQUE",PAGE)=0
 S ^MASQUEC(SCR,"DESC",PAGE)=0
 S @TB@(PAGE)=0
 Q
TESTPAGE 
 S TEST=0
 S TEST=^MASQUE(SCR,"MASQUE",PAGE)'=0
 S:TEST=0 TEST=^MASQUE(SCR,"DESC",PAGE)'=0
 D:TEST=0 DELPAGE
 Q
 
DELPAGE 
 S ^MASQUE(SCR,"DESC")=^MASQUE(SCR,"DESC")-1
 S ^MASQUE(SCR)=^MASQUE(SCR)-1
 S ^MASQUEC(SCR)=^MASQUE(SCR)
 S ^MASQUEC(SCR,"DESC")=^MASQUE(SCR,"DESC")
 S ^MASQUE(SCR,"MASQUE")=^MASQUE(SCR,"DESC")
 S ^MASQUEC(SCR,"MASQUE")=^MASQUE(SCR,"DESC")
 K ^MASQUE(SCR,"DESC",PAGE)
 K ^MASQUE(SCR,"MASQUE",PAGE)
 S ^MASQUEC(SCR,"MASQUE",PAGE)=0
 S ^MASQUEC(SCR,"DESC",PAGE)=0
 K @TB@(PAGE)
 Q
DUPLPAGE 
 D POCLEPA^%VVIDEO W "A PARTIR DE LA PAGE ? " R PAGE1 G:(PAGE1+0)'=PAGE1 DUPLPAGE
 W " NOUVELLE PAGE ? " R PAGE2 G:(PAGE2+0)'=PAGE2 DUPLPAGE
 I '($D(^MASQUE(SCR,"DESC",PAGE1))) D POCLEPA^%VVIDEO W "PAS DE PAGE ",PAGE1 Q
 S ^MASQUE(SCR,"DESC")=^MASQUE(SCR,"DESC")+1
 S ^MASQUE(SCR)=^MASQUE(SCR)+1
 S ^MASQUEC(SCR)=^MASQUE(SCR)
 S ^MASQUEC(SCR,"DESC")=^MASQUE(SCR,"DESC")
 S ^MASQUE(SCR,"MASQUE")=^MASQUE(SCR,"DESC")
 S ^MASQUEC(SCR,"MASQUE")=^MASQUE(SCR,"DESC")
 S NOMTREE="^MASQUE("""_SCR_""",""DESC"","_PAGE1
 S %TREECOP="^MASQUE(SCR,""DESC"",PAGE2"
 D ^%QCAGLC
 S NOMTREE="^MASQUE("""_SCR_""",""MASQUE"","_PAGE1
 S %TREECOP="^MASQUE(SCR,""MASQUE"",PAGE2"
 D ^%QCAGLC
 S @TB@(PAGE2)=0
 D COMP^%VCOMPMA(SCR)
 D DESC^%VCOMPMA(SCR)
 Q

