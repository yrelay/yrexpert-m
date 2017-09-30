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

;%TLBACH2^INT^1^59547,74028^0
%TLBACH2 ;
 
TRAIT 
 N I,J,COURANT,GLOSTO,PLANR,PLANE,TABC
 S COURANT="PLAN",GLOSTO="^[QUI]TTL(TRT,2)"
 S PLANR=@GLOETD@(NIVEAU,"NOM.SORTIE")
 S PLANE=@GLOETD@(NIVEAU,"NOM.ECHEC")
BCLTRT 
 K TABC
 S TABC(1)="ORDRE.EXECUTION",TABC(2)="REUSSITES",TABC(3)="ECHECS",TABC(4)="SOURCE",TABC(5)="MODIFICATION.SOURCE",TABC(6)="ARBRE.APPEL"
 D EFFBAS
 S CHOIX=$$^%VZECHO("TABC")
PLAN 
 I CHOIX'="ORDRE.EXECUTION" G REUSSI
 I COURANT'="PLAN" D REAF^%TLBAIF(2)
 S I=$$CHOIX^%TLBAGF2("TRT",0,0)
FPLNEX 
 S COURANT="PLAN"
 G BCLTRT
REUSSI 
 I CHOIX'="REUSSITES" G ECHEC
 S NIVEAU=NIVEAU+1
 I COURANT="REUSSI" G FREU
 K @GLOETD@(NIVEAU,"PLAN")
 S I=""
BCLREU S I=$O(@PLANR@(I))
 I I="" G FREU
 S @GLOETD@(NIVEAU,"PLAN",I)=$J(I,3)_" "_@GLOSTO@(@PLANR@(I))
 G BCLREU
 
FREU D INIT^%TLBAIF(2),REAF^%TLBAIF(2)
 S I=$$CHOIX^%TLBAGF2("TRT",0,0)
 D END^%TLBAIF(2)
 S NIVEAU=NIVEAU-1
 S COURANT="REUSSI"
 G BCLTRT
ECHEC 
 I CHOIX'="ECHECS" G SOURCE
 S NIVEAU=NIVEAU+1
 I COURANT="ECHEC" G FECH
 K @GLOETD@(NIVEAU,"PLAN")
 S I="",J=1
BCLECH S I=$O(@PLANE@(I))
 I I="" G FECH
 S @GLOETD@(NIVEAU,"PLAN",J)=$J(J,3)_" "_@GLOSTO@(I),J=J+1
 G BCLECH
 
FECH D INIT^%TLBAIF(2),REAF^%TLBAIF(2)
 S I=$$CHOIX^%TLBAGF2("TRT",0,0)
 D END^%TLBAIF(2)
 S NIVEAU=NIVEAU-1
 S COURANT="ECHEC"
 G BCLTRT
SOURCE 
 I CHOIX'="SOURCE" G MODIF
 S NIVEAU=NIVEAU+1
 I COURANT="SOURCE" G FSOU
 K @GLOETD@(NIVEAU,"PLAN")
 S I=""
BCLSOU S I=$O(@GLOSTO@(I))
 I I="" G FSOU
 S @GLOETD@(NIVEAU,"PLAN",I)=@GLOSTO@(I)
 G BCLSOU
 
FSOU D INIT^%TLBAIF(2),REAF^%TLBAIF(2)
 S I=$$CHOIX^%TLBAGF2("TRT",0,0)
 D END^%TLBAIF(2)
 S NIVEAU=NIVEAU-1
 S COURANT="SOURCE"
 G BCLTRT
MODIF 
 I CHOIX'="MODIFICATION.SOURCE" G ARBRE
 D CLEPAG^%VVIDEO
 D ^%TLSAISI(TRT)
 
 
 D REAF^%TLBAIF(0)
 S COURANT="PLAN"
 G BCLTRT
ARBRE 
 I CHOIX'="ARBRE.APPEL" G AUTRES
 D CLEPAG^%VVIDEO
 D ^%QMNF5($$CONCAS^%QZCHAD(GLOETD,"ARBRE.APPEL"),"","001- "_@GLOETD@(1,"TRAITEMENT"),"",9999)
 D REAF^%TLBAIF(0)
 S COURANT="PLAN"
 G BCLTRT
AUTRES 
 I CHOIX=18 D REAF^%TLBAIF(0) G BCLTRT
 I (CHOIX'=1)&(CHOIX'=6) D ^%VSQUEAK G BCLTRT
 I COURANT'="PLAN" D REAF^%TLBAIF(2)
 Q
 
INIAF3 
 N I
 D REAF^%TLBAIF(0)
 D POINTER^%TLBAGF1("TRT",L)
 S MODAF=2 D AFFPAS S MODAF=3
 S I=NIVEAU
RETNIV I '($D(@GLOETD@(I,"INDIVIDU.COURANT"))) S I=I-1 G RETNIV
 S I=@GLOETD@(I,"INDIVIDU.COURANT")
 D POINTER^%TLBAGF1("LIS",I)
 Q
 
CHMODE 
 N I,TABC
 D EFFBAS
 K TABC
 S TABC(1)="VISIBLE",TABC(2)="INVISIBLE",TABC(3)="JOURNAL.INHIBE"
 S I=$$^%VZECHO("TABC")
 I I="VISIBLE" S MODAF=2 I $D(@GLOETD@("JOURNAL"))#10,@GLOETD@("JOURNAL")=0 S @GLOETD@("JOURNAL")=1 D AFFPAS
 I I="INVISIBLE" S MODAF=3
 I (I["JOURNAL")&(MODAF=2) S @GLOETD@("JOURNAL")=0
 D REAF^%TLBAIF(3)
 Q
 
EFFBAS 
 N DX,DY
 S DX=0,DY=22 X XY D CLEBAS^%VVIDEO
 Q
 
DUREX 
 N DUREE,HEURE
 S HEURE=$H,DUREE=@GLOETD@("DUREE.EXECUTION")
 S DUREE=($P(DUREE,",",1)+($P(HEURE,",",1)-$P(@GLOETD@("HEURE.DEBUT"),",",1)))_","_($P(DUREE,",",2)+($P(HEURE,",",2)-$P(@GLOETD@("HEURE.DEBUT"),",",2)))
 S @GLOETD@("DUREE.EXECUTION")=DUREE
 S DUREE=$S($P(DUREE,",",1)'=0:$P(DUREE,",",1)_" "_$$^%QZCHW("jour(s)")_" ",1:"")_$$HEURNO2^%QMDATE($P(DUREE,",",2))
 I EXEC'="" D ADD^%TLIFEN("LOG",$$^%QZCHW("temps cumule d'execution")_" : "_DUREE)
 Q
 
INCPAS 
 N PAS
 S PAS=@GLOETD@("PAS")+1,@GLOETD@("PAS")=PAS
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),"%PAS",PAS,1)
 
 S PAS=$P(@GLOETD@("PAS.ARBRE"),".",1,NIVEAU)
 S $P(PAS,".",NIVEAU)=$P(PAS,".",NIVEAU)+1
 S @GLOETD@("PAS.ARBRE")=PAS
 D AFFPAS
 Q
AFFPAS 
 N MSG
 I MODAF=0 Q
 D ADD^%TLIFEN("LOG"," ")
 S MSG="--->"_$$^%QZCHW("regles executees")_" : "_@GLOETD@("PAS")_"; "
 S MSG=MSG_$$^%QZCHW("pas numero")_" "
 S MSG=MSG_$P(@GLOETD@("PAS.ARBRE"),".",NIVEAU)
 S MSG=MSG_" "_$$^%QZCHW("pour profondeur")_" "
 S MSG=MSG_$P(@GLOETD@("PAS.TRAITEMENT"),".",1,NIVEAU)
 D ADD^%TLIFEN("LOG",MSG)
 Q
 
QSUPVL 
 D POCLEPA^%VVIDEO
 I $$MES^%VZEOUI($$^%QZCHW("suppression des variables locales")_" ? ","O")=1 D TUERVL
 D POCLEPA^%VVIDEO
 Q
TUERVL 
 N TEMP,I
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 D ATTRIB(CXT("%","BASE"),CXT("%","OBJET"),TEMP)
 S I=1
BTUEAT 
 I I>@TEMP G FTUEVL
 I $E(@TEMP@(I,"ATTRIBUT"))="%" D PS^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),@TEMP@(I,"ATTRIBUT"),@TEMP@(I,"VALEUR"),@TEMP@(I,"INDICE"))
 S I=I+1
 G BTUEAT
FTUEVL 
 Q
ATTRIB(BA,OBJ,GLOB) 
 N ATTR,VAL,ORD,LL
 K @(GLOB) S LL=0,ATTR=""
BATTR S ATTR=$$NXTRIA^%QSTRUC8(BA,OBJ,ATTR)
 I ATTR="" G FBATTR
 S ORD=""
BORD S ORD=$$NXTRIAO^%QSTRUC8(BA,OBJ,ATTR,ORD)
 G:ORD="" BATTR
 S VAL=$$VALEUR^%QSTRUC8(BA,OBJ,ATTR,ORD)
 S LL=LL+1,@GLOB@(LL,"ATTRIBUT")=ATTR,@GLOB@(LL,"VALEUR")=VAL,@GLOB@(LL,"INDICE")=ORD
 G BORD
FBATTR 
 S @GLOB=LL
 Q

